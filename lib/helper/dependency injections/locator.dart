import 'package:get_it/get_it.dart';
import '../../domain/repository/NewsRepository.dart';
import '../../domain/service/NewsService.dart';
import '../../viewmodel/newsViewModel.dart';
import '../state management/bloc_news.dart';


final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<NewsService>(NewsService());

  locator.registerLazySingleton(() => NewsRepository(locator.get()));

  locator.registerLazySingleton(() => NewsBloc(locator.get()));

  locator.registerLazySingleton(() => NewsViewModel(locator.get()));


}