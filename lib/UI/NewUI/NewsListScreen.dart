import 'package:flutter/material.dart';
import '../../viewmodel/newsViewModel.dart';
import '../Widget/RowNewsSection.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  final newsViewModel = NewsViewModel();

  @override
  void initState() {
    super.initState();
    _loadNews(); // Tải lần đầu
  }

  Future<void> _loadNews() async {
    await newsViewModel.getNews();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final news = newsViewModel.news;

    return Scaffold(
      body: news.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
        onRefresh: _loadNews,
        child: ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) {
            final item = news[index];
            return RowNewsSection(context, item);
          },
        ),
      ),
    );
  }
}
