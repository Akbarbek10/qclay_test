import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';

part 'home_state.dart';

enum SnackTypes { all, choco, chips, sweets }

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(
          const HomeState(
            selectedSnackTypeItem: SnackTypes.choco,
          ),
        ) {
    on<SnackTypeSelectedEvent>(_onSnackTypeSelected);
  }

  _onSnackTypeSelected(SnackTypeSelectedEvent event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(selectedSnackTypeItem: event.snackType),
    );
  }
}
