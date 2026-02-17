import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
  ],
);
