import 'package:dio/dio.dart';

import '../models/newList.dart';

class NewsService{
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  Future<List<NewsItem>> getNews() async {
    final response = await _dio.get('/v2/everything?q=tesla&sortBy=publishedAt&apiKey=101793badfc14e7288721fd180361228');
    final List<dynamic> articles = response.data['articles'];

    return articles.map((json) => NewsItem.fromJson(json)).toList();
  }

}