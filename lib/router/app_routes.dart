import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qclay_test/features/cart/presentation/pages/cart/cart_page.dart';
import 'package:qclay_test/features/home/presentation/pages/home/home_page.dart';
import 'package:qclay_test/features/home/presentation/pages/product/product_page.dart';
import 'package:qclay_test/features/snack_collections/presentation/pages/snack_collections_page.dart';

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

    GoRoute(
      name: Routes.product,
      path: Routes.product,
      builder: (_, __) => const ProductPage(),
    ),

    GoRoute(
      name: Routes.cart,
      path: Routes.cart,
      builder: (_, __) => const CartPage(),
    ),


    GoRoute(
      name: Routes.snackCollection,
      path: Routes.snackCollection,
      builder: (_, __) => const SnackCollectionsPage(),
    ),

  ],
);
