import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/home/presentation/pages/home_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home', // Tạm thời để home để test UI
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
  ],
  // FIX: Thêm redirect logic
  redirect: (BuildContext context, GoRouterState state) {
    // Logic check auth token ở đây
    // Ví dụ: final isLoggedIn = context.read<AuthBloc>().state is AuthAuthenticated;
    // if (!isLoggedIn && state.matchedLocation != '/login') return '/login';
    return null;
  },
);
