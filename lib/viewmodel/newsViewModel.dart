
import '../models/newList.dart';
import '../service/NewsService.dart';

class NewsViewModel {
  final NewsService _newsService = NewsService();

  List<NewsItem> _news = [];
  List<NewsItem> get news => _news;
  bool isLoading = false;
  String? errorMessage;

  Future<void> getNews() async {
    isLoading = true;
    try {
      final response = await _newsService.getNews();
      print(response);
      _news = response;

      print("Lấy news thành công");
    } catch (e, response) {
      print(response);
      errorMessage = e.toString();
      print("Lấy news thất bại. Lỗi: $errorMessage");
    }

    isLoading = false;
  }
}
