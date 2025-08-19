import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UI/NewUI/DetailNews.dart';
import 'UI/TodoUI/DetailTask.dart';
import 'UI/mainscaffold.dart';
import 'dependency injections/locator.dart';
import 'hive/hivefunction.dart';
import 'models/newList.dart';
import 'models/taskList.dart';
import './state management/bloc_task.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // if (!Hive.isBoxOpen('Task Box')) {
  //   await Hive.deleteBoxFromDisk('Task Box');
  // }
  await Hive.openBox(taskHiveBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskBloc(locator.get())..add(LoadTasks()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        theme: ThemeData(primarySwatch: Colors.red),
        routerConfig: _router,
      ),
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
