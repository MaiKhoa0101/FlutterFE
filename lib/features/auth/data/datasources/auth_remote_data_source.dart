import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<UserModel> login(String email, String password) async {
    // Implement API call
    try {
      final response = await dio.post('/login', data: {'email': email, 'password': password});
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to login');
    }
  }
}
