import 'package:flutter/foundation.dart';

import '../dataclass/newList.dart';
import '../domain/repository/NewsRepository.dart';

// NewsViewModel là một lớp ViewModel để quản lý trạng thái của dữ liệu tin tức
// Nó sử dụng NewsRepository để lấy dữ liệu và cung cấp các phương thức để truy cập
// dữ liệu tin tức. ViewModel này sẽ được sử dụng trong các widget để hiển thị
// dữ liệu tin tức và xử lý các sự kiện liên quan đến dữ liệu.
class NewsViewModel {
  // Biến này sẽ lưu trữ instance của NewsRepository để sử dụng trong NewsViewModel
  // Khi sử dụng locator để lấy NewsRepository, nó sẽ tự động lấy NewsService đã
  // đăng ký và truyền vào NewsRepository.
  final NewsRepository _newsRepository;

  // Constructor của NewsViewModel, nó sẽ nhận vào một instance của NewsRepository
  // và gán nó cho biến _newsRepository.
  NewsViewModel(this._newsRepository);

  // Biến này sẽ lưu trữ danh sách các đối tượng NewsItem, đại diện cho các tin tức
  // Nó sẽ được cập nhật khi có dữ liệu mới từ NewsRepository.
  List<NewsItem> _news = [];

  // Getter để truy cập danh sách tin tức từ bên ngoài
  // Getter này sẽ trả về danh sách các đối tượng NewsItem, đại diện cho các
  // tin tức đã được lấy từ NewsRepository.
  // Nó sẽ được sử dụng trong các widget để hiển thị danh sách tin tức.  
  List<NewsItem> get news => _news;

  // Biến này sẽ lưu trữ trạng thái của việc lấy dữ liệu tin tức
  bool isLoading = false;

  // Biến này sẽ lưu trữ thông báo lỗi nếu có lỗi xảy ra trong quá trình lấy dữ liệu
  String? errorMessage;

  // Phương thức này sẽ gọi phương thức getNews của NewsRepository để lấy dữ liệu tin tức
  // và cập nhật biến _news với danh sách các đối tượng NewsItem. Nếu có lỗi xảy ra,
  // nó sẽ cập nhật biến errorMessage với thông báo lỗi. Phương thức này sẽ được gọi
  // trong các widget để lấy dữ liệu tin tức và hiển thị nó.
  Future<void> getNews() async {
    isLoading = true;
    try {
      _news = await _newsRepository.getNews();
      if (kDebugMode) {
        print("Lấy news thành công");
      }
    } catch (e, response) {
      if (kDebugMode) {
        print(response);
      }
      errorMessage = e.toString();
      if (kDebugMode) {
        print("Lấy news thất bại. Lỗi: $errorMessage");
      }
    }
    isLoading = false;
  }
}
