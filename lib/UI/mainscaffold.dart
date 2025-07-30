import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'NewUI/NewsListScreen.dart';
import 'TodoUI/TodoList.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    NewsListScreen(),
    TaskScreen(),
  ];

  final List<String> titles = [
    'Trang chủ',
    'Danh sách',
  ];

  final List<Color> appBarColors = [
    Color(0xFFF54949),
    Colors.green,
  ];

  void _onBottomNavTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex]),
        backgroundColor: appBarColors[currentIndex],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xFFF54949),
        unselectedItemColor: Colors.grey,
        onTap: _onBottomNavTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Danh sách',
          ),
          // Mở rộng thêm tab ở đây nếu cần
        ],
      ),
    );
  }
}
