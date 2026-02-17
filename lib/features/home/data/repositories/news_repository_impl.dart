import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/news.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/home_remote_data_source.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  final HomeRemoteDataSource remoteDataSource;

  NewsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<News>>> getNews() async {
    try {
      final models = await remoteDataSource.getNews();
      return Right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return const Left(ServerFailure('Failed to fetch news'));
    }
  }
}
