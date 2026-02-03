// lib/features/news/domain/usecases/get_news_usecase.dart
import 'package:dartz/dartz.dart';
import '../../dataclass/failure.dart';
import '../../dataclass/newList.dart';
import '../repository/NewsRepository.dart';

class GetNewsUseCase {
  final NewsRepository repository;

  GetNewsUseCase(this.repository);

  Future<Either<Failure, List<NewsItem>>> call() async {
    return await repository.getNews();
  }
}