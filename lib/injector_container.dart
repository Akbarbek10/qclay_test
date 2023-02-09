import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:qclay_test/core/app_bloc/app_bloc.dart';
import 'package:qclay_test/features/home/presentation/bloc/home/home_bloc.dart';

final sl = GetIt.instance;

const box = 'qclay_test';

Future<void> init() async {
  // await initHive();
  sl.registerLazySingleton(
    () => Dio()..interceptors.addAll([]),
  );
  sl.registerSingleton<AppBloc>(AppBloc());
  // Features
  _homeFeature();
}

void _homeFeature() {
  sl.registerFactory(() => HomeBloc());
}
