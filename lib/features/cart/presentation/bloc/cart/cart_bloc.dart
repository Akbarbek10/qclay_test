import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc()
      : super(
    const CartState(),
  ) {
    // on<SnackTypeSelectedEvent>(_onSnackTypeSelected);
  }

// _onSnackTypeSelected(SnackTypeSelectedEvent event, Emitter<CartState> emit) {
//   emit(
//     state.copyWith(selectedSnackTypeItem: event.snackType),
//   );
// }
}
