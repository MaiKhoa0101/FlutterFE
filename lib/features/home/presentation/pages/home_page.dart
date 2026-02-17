import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quản lý cà phê Cherry'), backgroundColor: Colors.pink[200],),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.yellow[50]!, Colors.white],
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildMenuCard(
              context, 
              'Kho Nguyên Liệu', 
              Icons.warehouse_rounded, 
              Colors.orange, 
              '/inventory'
            ),
            _buildMenuCard(
              context, 
              'Menu & Công thức', 
              Icons.menu_book_rounded, 
              Colors.pink, 
              '/products'
            ),
            _buildMenuCard(
              context, 
              'Bán Hàng', 
              Icons.point_of_sale_rounded, 
              Colors.green, 
              '/pos'
            ),
            _buildMenuCard(
              context, 
              'Báo Cáo', 
              Icons.bar_chart_rounded, 
              Colors.purple, 
              '/reports'
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, Color color, String route) {
    return Card(
      elevation: 4,
      shadowColor: color.withOpacity(0.4),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => context.push(route),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, color.withOpacity(0.05)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 40, color: color),
              ),
              const SizedBox(height: 16),
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800])),
            ],
          ),
        ),
      ),
    );
  }
}
