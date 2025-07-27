import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'UI/detailnews.dart';
import 'UI/home.dart';
import 'models/newList.dart';

void main() async {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/detailnews',
      builder: (context, state) {
        final item = state.extra as NewsItem;
        return DetailNewsScreen(item: item);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
        title: "Trang chu",
        routerConfig: _router,
        theme: ThemeData(
        primarySwatch: Colors.blue,
        )
    );
  }
}
