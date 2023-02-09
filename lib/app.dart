import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:qclay_test/core/app_bloc/app_bloc.dart';
import 'package:qclay_test/core/theme/theme_data.dart';
import 'package:qclay_test/router/app_routes.dart';
import 'package:qclay_test/router/name_routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (_, state) {
        return KeyboardDismisser(
          child: MaterialApp.router(
            title: 'qclay_test',
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            routerConfig: router,
          ),
        );
      },
    );
  }
}
