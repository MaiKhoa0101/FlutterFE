
// Dòng này định nghĩa một factory class để tạo các đối tượng NewsItem từ JSON
// Factory class này sẽ giúp tách biệt logic tạo đối tượng khỏi các phần khác của ứng

import '../../dataclass/newList.dart';

class NewsFactory {
  // Phương thức này nhận vào một Map JSON và trả về một đối tượng NewsItem
  // Nó sử dụng phương thức fromJson của NewsItem để tạo đối tượng từ JSON
  static NewsItem fromJson(Map<String, dynamic> json) {
    // Trả về một đối tượng NewsItem được tạo từ JSON
    // Phương thức fromJson sẽ được định nghĩa trong class NewsItem
    return NewsItem.fromJson(json);
  }
}