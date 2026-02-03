
import 'package:equatable/equatable.dart';

class NewsItem extends Equatable {
  final String id;
  final String title;
  final String content;
  final List<String> media;
  const NewsItem({
    required this.title,
    required this.content,
    required this.media,
    required this.id,
  });

  @override
  List<Object?> get props => [id, title, content, media];
}

class NewsModel extends NewsItem {
  const NewsModel({required super.id, required super.title, required super.content, required super.media});
  // Parse từ JSON API trả về
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'] ?? '',     // Xử lý null safety
      title: json['title'] ?? '',
      content: json['body'] ?? '', // Giả sử API trả về field 'body'
      media: List<String>.from(json['media'] ?? [])
    );
  }
}