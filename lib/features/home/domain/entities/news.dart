import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String id;
  final String title;
  final String content;
  final String? imageUrl;
  final DateTime createdAt;

  const News({
    required this.id,
    required this.title,
    required this.content,
    this.imageUrl,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, title, createdAt];
}
