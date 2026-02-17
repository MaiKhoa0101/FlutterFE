import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home_page.dart';
import '../../features/inventory/presentation/pages/inventory_page.dart';
import '../../features/product/presentation/pages/product_list_page.dart';
import '../../features/sales/presentation/pages/pos_page.dart';
import '../../features/report/presentation/pages/report_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/inventory',
      builder: (BuildContext context, GoRouterState state) {
        return const InventoryPage();
      },
    ),
    GoRoute(
      path: '/products',
      builder: (BuildContext context, GoRouterState state) {
        return const ProductListPage();
      },
    ),
    GoRoute(
      path: '/pos',
      builder: (BuildContext context, GoRouterState state) {
        return const PosPage();
      },
    ),
    GoRoute(
      path: '/reports',
      builder: (BuildContext context, GoRouterState state) {
        return const ReportPage();
      },
    ),
  ],
);
