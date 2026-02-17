import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String id;
  final String content;
  final String? imageUrl;
  final String? videoUrl;
  final String authorName;
  final String? authorAvatar;
  final DateTime createdAt;
  final int likes;
  final int comments;

  const Post({
    required this.id,
    required this.content,
    this.imageUrl,
    this.videoUrl,
    required this.authorName,
    this.authorAvatar,
    required this.createdAt,
    this.likes = 0,
    this.comments = 0,
  });

  @override
  List<Object?> get props => [id, content, createdAt];
}
