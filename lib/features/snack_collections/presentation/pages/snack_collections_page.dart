import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qclay_test/features/snack_collections/presentation/bloc/snack_collections_bloc.dart';
import 'package:qclay_test/injector_container.dart';

class SnackCollectionsPage extends StatelessWidget {
  const SnackCollectionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SnackCollectionsBloc>(),
      child: const SnackCollectionsPageBody(),
    );
  }
}

class SnackCollectionsPageBody extends StatelessWidget {
  const SnackCollectionsPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [

        ],
      ),
    );
  }
}
