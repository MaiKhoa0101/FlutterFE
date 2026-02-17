import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../models/doctor_model.dart';
import '../models/news_model.dart';
import '../models/post_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<DoctorModel>> getDoctors();
  Future<DoctorModel> getDoctorById(String id);
  Future<List<SpecialtyModel>> getSpecialties();
  Future<List<NewsModel>> getNews();
  Future<List<PostModel>> getPosts(int skip, int limit);
}

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSourceImpl(this.dio);

  @override
  Future<List<DoctorModel>> getDoctors() async {
    final response = await dio.get('/doctors');
    // FIX: Check type trước khi map
    if (response.data is! List) throw FormatException("API Doctors không trả về List");
    return (response.data as List)
        .map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<DoctorModel> getDoctorById(String id) async {
    final response = await dio.get('/doctors/$id');
    // FIX: Check type trước khi map
    if (response.data is! Map) throw FormatException("API Doctor/$id không trả về Object");
    return DoctorModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<List<SpecialtyModel>> getSpecialties() async {
    final response = await dio.get('/specialties');
    // FIX: Check type trước khi map
    if (response.data is! List) throw FormatException("API Specialties không trả về List");
    return (response.data as List)
        .map((e) => SpecialtyModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<NewsModel>> getNews() async {
    final response = await dio.get('/news');
    // FIX: Check type trước khi map
    if (response.data is! List) throw FormatException("API News không trả về List");
    return (response.data as List)
        .map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<PostModel>> getPosts(int skip, int limit) async {
    final response = await dio.get(
      '/posts',
      queryParameters: {'skip': skip, 'limit': limit},
    );
    // FIX: Check type trước khi map
    if (response.data is! List) throw FormatException("API Posts không trả về List");
    return (response.data as List)
        .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
