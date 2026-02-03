import 'package:flutter_bloc/flutter_bloc.dart';
import '../../dataclass/newList.dart';
import '../../domain/repository/NewsRepository.dart';

// Bloc để quản lý trạng thái của dữ liệu tin tức
// Nó sẽ sử dụng NewsRepository để lấy dữ liệu và cung cấp các phương thức để truy
// cập dữ liệu tin tức. Bloc này sẽ được sử dụng trong các widget để hiển thị
// dữ liệu tin tức và xử lý các sự kiện liên quan đến dữ liệu.
abstract class NewsEvent {}
// Các sự kiện có thể xảy ra trong Bloc này
// Ví dụ: khi người dùng muốn lấy dữ liệu tin tức, chúng ta sẽ phát ra sự kiện GetNews
// Khi cần tải lại dữ liệu tin tức, chúng ta sẽ phát ra sự kiện LoadNews
class GetNews extends NewsEvent {}
// Sự kiện này sẽ được phát ra khi cần lấy dữ liệu tin tức
// Bloc sẽ lắng nghe sự kiện này và gọi phương thức getNews của NewsRepository để
// lấy dữ liệu tin tức. Sau đó, nó sẽ cập nhật trạng thái của Bloc với danh sách
// các đối tượng NewsItem. Nếu có lỗi xảy ra, nó sẽ cập nhật trạng thái với thông báo lỗi.
// Khi trạng thái được cập nhật, các widget sẽ tự động nhận được thông báo và cập
// nhật giao diện để hiển thị dữ liệu tin tức mới nhất.
// Sự kiện này sẽ được sử dụng trong các widget để lấy dữ liệu tin tức và
// hiển thị nó. Ví dụ: khi người dùng nhấn nút "Tải lại", chúng ta sẽ phát ra sự kiện này
// để Bloc có thể lấy dữ liệu tin tức mới nhất từ NewsRepository.
class LoadNews extends NewsEvent {}
// Trạng thái của Bloc sẽ được quản lý bằng các lớp con của NewsState
// Mỗi trạng thái sẽ đại diện cho một giai đoạn trong quá trình lấy dữ liệu
abstract class NewsState {}
// Các trạng thái có thể xảy ra trong Bloc này
// Ví dụ: khi Bloc đang lấy dữ liệu tin tức, nó sẽ ở trạng thái NewsLoading
// Khi Bloc đã lấy dữ liệu thành công, nó sẽ ở trạng thái NewsLoaded với danh sách
// các đối tượng NewsItem. Nếu có lỗi xảy ra, nó sẽ ở trạng thái News Error với thông báo lỗi.
// Các widget sẽ lắng nghe các trạng thái này và cập nhật giao diện để hiển thị dữ liệu
// tin tức hoặc thông báo lỗi nếu có.
class NewsInitial extends NewsState {}
// Trạng thái ban đầu của Bloc, khi chưa có dữ liệu tin tức nào được lấy
// Trạng thái này sẽ được sử dụng khi Bloc mới được khởi tạo và chưa có dữ liệu tin tức nào.
// Khi Bloc bắt đầu lấy dữ liệu tin tức, nó sẽ chuyển sang trạng thái NewsLoading
class NewsLoading extends NewsState {}
// Trạng thái khi Bloc đang lấy dữ liệu tin tức
// Trạng thái này sẽ được sử dụng khi Bloc đang gọi phương thức getNews của NewsRepository
// để lấy dữ liệu tin tức. Trong trạng thái này, các widget sẽ hiển thị một
// vòng xoay tải dữ liệu hoặc một thông báo "Đang tải..." để cho người dùng biết rằng
// dữ liệu đang được lấy. Khi Bloc đã lấy dữ liệu thành công, nó sẽ chuyển sang trạng thái NewsLoaded
// với danh sách các đối tượng NewsItem. Nếu có lỗi xảy ra, nó sẽ chuyển sang trạng thái NewsError
// với thông báo lỗi.
class NewsLoaded extends NewsState {
  // Trạng thái khi Bloc đã lấy dữ liệu tin tức thành công
  // Nó sẽ chứa danh sách các đối tượng NewsItem, đại diện cho các tin tức
  // Trạng thái này sẽ được sử dụng khi Bloc đã gọi phương thức getNews của NewsRepository
  // và đã nhận được danh sách các đối tượng NewsItem. Các widget sẽ lắng nghe
  // trạng thái này và cập nhật giao diện để hiển thị danh sách tin tức.
  final List<NewsItem> news;
  // Constructor của NewsLoaded, nó sẽ nhận vào danh sách các đối tượng NewsItem
  // và gán nó cho biến news. Biến này sẽ được sử dụng trong các widget để hiển thị
  // danh sách tin tức. Khi trạng thái này được phát ra, các widget sẽ tự động nhận
  // được thông báo và cập nhật giao diện để hiển thị danh sách tin tức mới nhất.
  // Ví dụ: khi Bloc đã lấy dữ liệu tin tức thành công, nó sẽ phát ra trạng thái này
  // và các widget sẽ hiển thị danh sách tin tức trong một ListView hoặc GridView.
  // Các widget có thể sử dụng biến news để hiển thị danh sách tin tức trong
  // giao diện người dùng, chẳng hạn như trong một ListView hoặc GridView.
  NewsLoaded(this.news);
}

// Trạng thái khi có lỗi xảy ra trong quá trình lấy dữ liệu tin tức
// Trạng thái này sẽ được sử dụng khi Bloc gặp lỗi trong quá trình gọi phương thức
// getNews của NewsRepository để lấy dữ liệu tin tức. Khi Bloc gặp lỗi, nó sẽ
// chuyển sang trạng thái này với thông báo lỗi. Các widget sẽ lắng nghe trạng thái này
// và cập nhật giao diện để hiển thị thông báo lỗi cho người dùng.
class NewsError extends NewsState {
  final String message;
  NewsError(this.message);
}

// Bloc để quản lý trạng thái của dữ liệu tin tức
// Nó sẽ sử dụng NewsRepository để lấy dữ liệu và cung cấp các phương thức để truy 
// cập dữ liệu tin tức. Bloc này sẽ được sử dụng trong các widget để hiển thị
// dữ liệu tin tức và xử lý các sự kiện liên quan đến dữ liệu.
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository;
  NewsBloc(this.repository) : super(NewsInitial()) {
    on<GetNews>((event, emit) async {
      emit(NewsLoading());
      try {
        final news = await repository.getNews();
        emit(NewsLoaded(news));
      } catch (e) {
        emit(NewsError(e.toString()));
      }
    });
  }
}