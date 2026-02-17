import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart'; // Đây là file sẽ sinh ra khi build

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();
