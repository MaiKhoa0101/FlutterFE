import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio();
    // Thay đổi BaseURL nếu cần
    dio.options.baseUrl = "http://10.0.2.2:3000/api"; 
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
    
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
    ));
    
    return dio;
  }
}
