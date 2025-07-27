
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/newList.dart';
import '../viewmodel/newsViewModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final newsViewModel = NewsViewModel();
  var index = 0;

  @override
  void initState() {
    super.initState();
    newsViewModel.getNews().then((_) {
      setState(() {}); // Cập nhật UI sau khi dữ liệu load xong
    });
  }

  @override
  Widget build(BuildContext context) {
    var news = newsViewModel.news;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFFF54949),
      ),
      body: news.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              final item = news[index];
              return NewsSection(context, item);
            },
          ),
      floatingActionButton: index == 1
          ? FloatingActionButton(
              onPressed: () {
                newsViewModel.getNews();
              },
              child: const Icon(Icons.add),
              backgroundColor: const Color(0xFFF54949),
            )
          : null,
      bottomNavigationBar:
        BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Danh sách',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Cá nhân',
            ),
          ],
          currentIndex: index,
          selectedItemColor: const Color(0xFFF54949),
          unselectedItemColor: Colors.grey,
          onTap: (i) {
            setState(() {
              index = i;
            });
          },
        ),
    );
  }
}


Widget NewsSection(BuildContext context ,NewsItem item){
  return InkWell(
      onTap: () {
        context.push('/detailnews', extra: item);
      },
      child:
        Column(
          children: [
            Divider(
              color: Colors.grey,
              thickness: 1,
              height: 0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      item.title,
                      maxLines:5,
                      overflow: TextOverflow.fade
                    )
                  ),
                  SizedBox(
                      width: 15
                  ),
                  PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert),
                    onSelected: (value) {
                      if (value == 'edit') {
                        print('Chỉnh sửa');
                      } else if (value == 'delete') {
                        print('Xoá');
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'edit',
                        child: Text('Chỉnh sửa'),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Text('Xoá'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
                color: Colors.grey,
                thickness: 1,
                height: 0,
            ),
          ]
        )
  );
}