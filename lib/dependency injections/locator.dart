import 'package:get_it/get_it.dart';
import '../data/repository/NewsRepository.dart';
import '../service/NewsService.dart';
import '../viewmodel/newsViewModel.dart';
import '../service/TaskService.dart';
import '../data/repository/HiveRepository.dart';

// Dòng này sẽ tạo một instance của GetIt để sử dụng trong toàn bộ ứng dụng
// GetIt là một package giúp quản lý Dependency Injection trong Flutter
final locator = GetIt.instance;
// Cái này sẽ được gọi trong hàm main.dart để đăng ký các dịch vụ và repository
// để có thể sử dụng chúng trong toàn bộ ứng dụng mà không cần phải khởi tạo
void setupLocator() {
  // Đăng ký NewsService để có thể sử dụng trong NewsRepository
  // Khi sử dụng locator để lấy NewsService, nó sẽ tự động tạo một instance mới
  locator.registerLazySingleton(() => NewsService());
  //Khi sử dụng locator để lấy NewsRepository, nó sẽ tự động lấy NewsService đã đăng ký
  //và truyền vào NewsRepository.
  locator.registerLazySingleton(() => NewsRepository(locator<NewsService>()));
  //Khi sử dụng locator để lấy NewsViewModel, nó sẽ tự động lấy NewsRepository đã đăng ký
  //và truyền vào NewsViewModel.
  locator.registerFactory(() => NewsViewModel(locator<NewsRepository>()));

  locator.registerLazySingleton<TaskService>(() => TaskService());
  locator.registerLazySingleton<TaskRepository>(() => TaskRepository(locator<TaskService>()));
}