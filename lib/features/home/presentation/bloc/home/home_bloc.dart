import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qclay_test/features/home/presentation/pages/home/models/snack_item_model.dart';

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
    on<AddSnackToCartEvent>(_onAddSnackToCart);
  }

  _onSnackTypeSelected(SnackTypeSelectedEvent event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(selectedSnackTypeItem: event.snackType),
    );
  }

  _onAddSnackToCart(AddSnackToCartEvent event, Emitter<HomeState> emit) {
    var cartItems = [...state.cartItems];
    cartItems.add(event.snack!);
    if (cartItems.length > 3) {
      cartItems.removeAt(0);
      emit(state.copyWith(cartItems: cartItems));
      return;
    }
    emit(
      state.copyWith(cartItems: cartItems),
    );
  }
}
