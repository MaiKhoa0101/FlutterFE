import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final userModel = await remoteDataSource.login(email, password);
      return Right(User(id: userModel.id, name: userModel.name, email: userModel.email));
    } catch (e) {
      return const Left(ServerFailure('Failed to login'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    // Implement logout logic
    return const Right(null);
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    // Implement get current user logic
    return const Left(CacheFailure('Not implemented'));
  }
}
