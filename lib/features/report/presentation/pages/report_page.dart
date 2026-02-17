import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../bloc/report_bloc.dart';
import 'package:intl/intl.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReportBloc>()..add(LoadDailyReport(DateTime.now())),
      child: const ReportView(),
    );
  }
}

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Thống kê & Báo cáo'),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Theo Ngày"),
              Tab(text: "Theo Tháng"),
            ],
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
          ),
        ),
        body: const TabBarView(
          children: [
            ReportBody(mode: 'day'),
            ReportBody(mode: 'month'),
          ],
        ),
      ),
    );
  }
}

class ReportBody extends StatefulWidget {
  final String mode; // 'day' or 'month'
  const ReportBody({super.key, required this.mode});

  @override
  State<ReportBody> createState() => _ReportBodyState();
}

class _ReportBodyState extends State<ReportBody> {
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    if (widget.mode == 'day') {
      context.read<ReportBloc>().add(LoadDailyReport(_selectedDate));
    } else {
      context.read<ReportBloc>().add(LoadMonthlyReport(_selectedDate));
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      _loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Filter Bar
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.grey[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.mode == 'day' 
                  ? "Ngày: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}"
                  : "Tháng: ${DateFormat('MM/yyyy').format(_selectedDate)}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(onPressed: _pickDate, icon: const Icon(Icons.calendar_month, color: Colors.brown)),
            ],
          ),
        ),
        
        // Content
        Expanded(
          child: BlocBuilder<ReportBloc, ReportState>(
            builder: (context, state) {
              if (state is ReportLoading) return const Center(child: CircularProgressIndicator());
              if (state is ReportError) return Center(child: Text("Lỗi: ${state.message}"));
              
              if (state is ReportLoaded) {
                final stats = state.stats;
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Overview Cards
                      Row(
                        children: [
                          Expanded(child: _SummaryCard("Doanh thu", stats.totalRevenue, Colors.green)),
                          const SizedBox(width: 10),
                          Expanded(child: _SummaryCard("Chi phí", stats.totalCost, Colors.orange)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(child: _SummaryCard("Lợi nhuận", stats.totalProfit, Colors.blue)),
                          const SizedBox(width: 10),
                          Expanded(child: _SummaryCard("Đơn hàng", stats.totalOrders.toDouble(), Colors.purple, isMoney: false)),
                        ],
                      ),
                      
                      const SizedBox(height: 24),
                      const Text("Top Món Bán Chạy", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const Divider(),
                      
                      if (stats.topProducts.isEmpty) const Text("Chưa có dữ liệu bán hàng."),
                      
                      ...stats.topProducts.map((p) => ListTile(
                        leading: const Icon(Icons.star, color: Colors.amber),
                        title: Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text("Đã bán: ${p.quantity}"),
                        trailing: Text(
                          NumberFormat.currency(locale: 'vi', symbol: 'đ').format(p.revenue),
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      )),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final double value;
  final Color color;
  final bool isMoney;

  const _SummaryCard(this.title, this.value, this.color, {this.isMoney = true});

  @override
  Widget build(BuildContext context) {
    final displayValue = isMoney 
      ? NumberFormat.compactCurrency(locale: 'vi', symbol: 'đ').format(value)
      : value.toInt().toString();

    return Card(
      elevation: 4,
      color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(displayValue, style: TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
