import '../../models/newList.dart';
import '../../service/NewsService.dart';

// Dòng này định nghĩa một class NewsRepository để quản lý việc lấy dữ liệu tin tức
// từ NewsService. Nó sẽ sử dụng phương thức getNews của NewsService để lấy dữ liệu
// và trả về một Future chứa danh sách các đối tượng NewsItem. Điều này giúp tách biệt
// logic lấy dữ liệu khỏi các phần khác của ứng dụng, giúp dễ dàng kiểm tra và
// bảo trì mã.
class NewsRepository{
  // Biến này sẽ lưu trữ instance của NewsService để sử dụng trong NewsRepository
  final NewsService _newsService;
  // Dòng này là constructor của NewsRepository, nó sẽ nhận vào một instance của NewsService
  // và gán nó cho biến _newsService.
  NewsRepository(this._newsService);
  // Phương thức này sẽ gọi phương thức getNews của NewsService để lấy dữ liệu tin tức
  // và trả về một Future chứa danh sách các đối tượng NewsItem. Nếu có lỗi xảy ra,
  // nó sẽ ném ra lỗi để có thể xử lý ở nơi gọi phương thức này.
  
  
  // Future là một kiểu dữ liệu trong Dart đại diện cho một giá trị sẽ có trong tương lai.
  // Nó thường được sử dụng để xử lý các tác vụ bất đồng bộ, chẳng hạn như gọi API.
  // List<NewsItem> là một danh sách chứa các đối tượng NewsItem, đại diện cho các tin tức.
  // NewsItem là một class đại diện cho một tin tức, nó có thể chứa các thông tin như tiêu đề, mô tả, ngày đăng, v.v.
  // getNews() là một phương thức trong NewsService, nó sẽ gọi API để lấy dữ liệu tin tức
  // và trả về một Future chứa danh sách các đối tượng NewsItem.
  Future<List<NewsItem>> getNews() async {
    try {
      final response = await _newsService.getNews();
      return response;
    }
    catch (e) {
      print("NewsRespository"+e.toString());
      throw e;
    }
  }
}