import 'package:equatable/equatable.dart';

class TopProduct extends Equatable {
  final String name;
  final int quantity;
  final double revenue;

  const TopProduct({
    required this.name,
    required this.quantity,
    required this.revenue,
  });

  @override
  List<Object?> get props => [name, quantity, revenue];
}

class ReportStats extends Equatable {
  final double totalRevenue;
  final double totalCost;
  final double totalProfit;
  final int totalOrders;
  final List<TopProduct> topProducts;

  const ReportStats({
    required this.totalRevenue,
    required this.totalCost,
    required this.totalProfit,
    required this.totalOrders,
    required this.topProducts,
  });

  @override
  List<Object?> get props => [totalRevenue, totalCost, totalProfit, totalOrders, topProducts];
}
