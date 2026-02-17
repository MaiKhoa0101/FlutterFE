import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}

@injectable
class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;
  int _skip = 0;
  final int _limit = 10;
  bool _hasMore = true;

  PostBloc(this.repository) : super(PostInitial()) {
    on<FetchPosts>(
      _onFetchPosts,
      transformer: debounce(const Duration(milliseconds: 300)),
    );
  }

  Future<void> _onFetchPosts(FetchPosts event, Emitter<PostState> emit) async {
    // Nếu là refresh, reset lại trạng thái ban đầu
    if (event.isRefresh) {
      _skip = 0;
      _hasMore = true;
      // Emit Loading để UI hiển thị indicator hoặc reset scroll
      emit(PostInitial()); 
    }

    // Nếu không còn dữ liệu và không phải refresh thì dừng
    if (!_hasMore && !event.isRefresh) return;

    // Nếu chưa có dữ liệu (Initial) thì chuyển sang Loading
    if (state is PostInitial) {
      emit(PostLoading());
    }

    // Gọi API lấy dữ liệu
    final result = await repository.getPosts(skip: _skip, limit: _limit);

    result.fold(
      (failure) {
        emit(PostError(failure.message));
        // Nếu load thất bại, _skip vẫn giữ nguyên giá trị cũ để lần sau retry đúng vị trí
      },
      (newPosts) {
        // Kiểm tra xem đã hết dữ liệu chưa (số lượng trả về ít hơn limit)
        if (newPosts.length < _limit) {
          _hasMore = false;
        }

        // Lấy danh sách hiện tại nếu có (cho trường hợp load more)
        final currentPosts = (state is PostLoaded && !event.isRefresh) 
            ? (state as PostLoaded).posts 
            : <Post>[];

        // Cập nhật danh sách mới
        final updatedList = [...currentPosts, ...newPosts];
        
        // Cập nhật _skip cho lần load tiếp theo
        _skip = updatedList.length;

        emit(PostLoaded(updatedList, hasMore: _hasMore));
      },
    );
  }
}
