import 'package:flutter/material.dart';
import '../../dataclass/newList.dart';
import '../Widget/DetailScreen.dart';
import '../Widget/TopBar.dart';

class DetailNewsScreen extends StatelessWidget {
  final NewsItem item;

  const DetailNewsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(context, "Tin tức", const Color(0xFFF54949)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleInDetail(item.title),
            const SizedBox(height: 10),
            authorAndTime(item.author, item.publishedAt),
            const SizedBox(height: 10),
            imageNews(item.urlToImage),
            const Divider(color: Colors.grey, thickness: 1),
            content(item.content),
          ],
        ),
      ),
    );
  }
}
