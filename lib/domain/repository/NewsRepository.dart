import 'package:dartz/dartz.dart';
import '../../dataclass/failure.dart';
import '../../dataclass/newList.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<NewsItem>>> getNews();
}
abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> getNews();
}
class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<NewsItem>>> getNews() async {
    try {
      final remoteNews = await remoteDataSource.getNews();
      return Right(remoteNews); // Right là thành công
    } catch (e) {
      return Left(ServerFailure()); // Left là thất bại
    }
  }
}