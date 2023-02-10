import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:qclay_test/core/app_bloc/app_bloc.dart';
import 'package:qclay_test/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:qclay_test/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:qclay_test/features/home/presentation/bloc/product/product_bloc.dart';
import 'package:qclay_test/features/snack_collections/presentation/bloc/snack_collections_bloc.dart';

final sl = GetIt.instance;

const box = 'qclay_test';

Future<void> init() async {
  // await initHive();

  sl.registerSingleton<AppBloc>(AppBloc());
  // Features
  _homeFeature();
  _productFeature();
  _snackCollectionsFeature();
  _cartFeature();
}

void _homeFeature() {
  sl.registerFactory(
    () => HomeBloc(),
  );
}

void _productFeature() {
  sl.registerFactory(
    () => ProductBloc(),
  );
}

void _snackCollectionsFeature() {
  sl.registerFactory(
    () => SnackCollectionsBloc(),
  );
}

void _cartFeature() {
  sl.registerFactory(
        () => CartBloc(),
  );
}
