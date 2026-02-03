import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../dataclass/newList.dart';
import '../../domain/usecase/get_news_usecase.dart';

// news_event.dart
abstract class NewsEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class GetNewsEvent extends NewsEvent {}

// news_state.dart
abstract class NewsState extends Equatable {
  @override
  List<Object> get props => [];
}
class NewsInitial extends NewsState {}
class NewsLoading extends NewsState {}
class NewsLoaded extends NewsState {
  final List<NewsItem> news;
  NewsLoaded(this.news);
}
class NewsError extends NewsState {
  final String message;
  NewsError(this.message);
}

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsUseCase getNewsUseCase;

  NewsBloc({required this.getNewsUseCase}) : super(NewsInitial()) {
    on<GetNewsEvent>((event, emit) async {
      emit(NewsLoading());

      final result = await getNewsUseCase();

      result.fold(
            (failure) => emit(NewsError("Lỗi kết nối server")), // Handle Left
            (newsList) => emit(NewsLoaded(newsList)),           // Handle Right
      );
    });
  }
}