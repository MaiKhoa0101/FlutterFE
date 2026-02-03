import 'package:dio/dio.dart';
import '../../dataclass/newList.dart';
import '../repository/NewsRepository.dart';


class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio dio;

  NewsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<NewsModel>> getNews() async {
    // Gọi API: http://192.168.1.219:4000/news
    final response = await dio.get('/news');

    if (response.statusCode == 200) {
      // Giả sử API trả về List JSON
      final List<dynamic> data = response.data;
      return data.map((json) => NewsModel.fromJson(json)).toList();
    } else {
      throw Exception('Server Error');
    }
  }
}