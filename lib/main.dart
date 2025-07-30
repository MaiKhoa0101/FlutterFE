import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'UI/NewUI/DetailNews.dart';
import 'UI/TodoUI/DetailTask.dart';
import 'UI/mainscaffold.dart';
import 'hive/hivefunction.dart';
import 'models/newList.dart';
import 'models/taskList.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isBoxOpen('Task Box')) {
    await Hive.deleteBoxFromDisk('Task Box');
  }
  // To open the user hive box
  await Hive.openBox(taskHiveBox);
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MainScaffold(),
    ),
    GoRoute(
      path: '/detailNews',
      builder: (context, state) {
        final item = state.extra as NewsItem;
        return DetailNewsScreen(item: item);
      },
    ),
    GoRoute(
      path: '/detailTask',
      builder: (context, state) {
        final item = state.extra as TaskItem;
        return DetailTask(item: item);
      },
    )
  ],
);

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
