import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../domain/repository/NewsRepository.dart';
import '../../domain/service/NewsService.dart';
import '../../domain/usecase/get_news_usecase.dart';
import '../state management/bloc_news.dart';


final sl = GetIt.instance;

Future<void> init() async {
  //! Features - News
  // Bloc
  sl.registerFactory(() => NewsBloc(getNewsUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetNewsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<NewsRepository>(
        () => NewsRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<NewsRemoteDataSource>(
        () => NewsRemoteDataSourceImpl(dio: sl()),
  );

  //! External
  sl.registerLazySingleton(() {
    final dio = Dio();
    dio.options.baseUrl = 'http://192.168.1.219:4000'; // Set Base URL ở đây
    return dio;
  });
}