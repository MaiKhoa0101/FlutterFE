
class NewsItem{
  final String author;
  final String title;
  final String content;
  final String urlToImage;
  final String publishedAt;
  NewsItem({
    required this.title,
    required this.content,
    required this.author,
    required this.urlToImage,
    required this.publishedAt
  });
  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      title: json['title'] ?? 'Chưa có tiêu đề',
      content: json['content'] ?? 'Chưa có nội dung',
      author: json['author'] ?? 'Ẩn danh',
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
    );
  }
}

