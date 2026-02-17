import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/home_remote_data_source.dart';

@Injectable(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final HomeRemoteDataSource remoteDataSource;

  PostRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Post>>> getPosts({int skip = 0, int limit = 10}) async {
    try {
      final models = await remoteDataSource.getPosts(skip, limit);
      return Right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return const Left(ServerFailure('Failed to fetch posts'));
    }
  }
}
