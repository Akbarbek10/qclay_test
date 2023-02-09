import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qclay_test/features/home/presentation/pages/home/home_page.dart';

import 'name_routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      name: Routes.home,
      path: Routes.home,
      builder: (_, __) => const HomePage(),
    ),

  ],
);
