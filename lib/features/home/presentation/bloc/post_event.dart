part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class FetchPosts extends PostEvent {
  final bool isRefresh;
  const FetchPosts({this.isRefresh = false});

  @override
  List<Object> get props => [isRefresh];
}
