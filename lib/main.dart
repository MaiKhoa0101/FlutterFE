import 'package:flutter/material.dart';
import 'package:flutterfetest/presentation/UI/NewUI/DetailNews.dart';
import 'package:flutterfetest/presentation/UI/TodoUI/DetailTask.dart';
import 'package:flutterfetest/presentation/UI/mainscaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dataclass/newList.dart';
import 'dataclass/taskList.dart';
import 'domain/hive/hivefunction.dart';
import 'helper/dependency injections/locator.dart';
import 'helper/state management/bloc_task.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isBoxOpen('Task Box')) {
    await Hive.deleteBoxFromDisk('Task Box');
  }
  await Hive.openBox(taskHiveBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        theme: ThemeData(primarySwatch: Colors.red),
        routerConfig: _router,
      );
  }
}

// Không cần BlocProvider trong GoRouter nữa!
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MainScaffold(),
      routes: [
        GoRoute(
          path: 'detailTask',
          builder: (context, state) {
            final item = state.extra as TaskItem;
            return DetailTask(item: item);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/detailNews',
      builder: (context, state) {
        final item = state.extra as NewsItem;
        return DetailNewsScreen(item: item);
      },
    ),
  ],
);
