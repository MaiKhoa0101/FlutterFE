import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/news.dart';
import '../../domain/repositories/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

@injectable
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository;

  NewsBloc(this.repository) : super(NewsInitial()) {
    on<FetchNews>((event, emit) async {
      emit(NewsLoading());
      final result = await repository.getNews();
      result.fold(
        (failure) => emit(NewsError(failure.message)),
        (news) => emit(NewsLoaded(news)),
      );
    });
  }
}
