import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc()
      : super(
          const ProductState(),
        ) {
    // on<SnackTypeSelectedEvent>(_onSnackTypeSelected);
  }

// _onSnackTypeSelected(SnackTypeSelectedEvent event, Emitter<ProductState> emit) {
//   emit(
//     state.copyWith(selectedSnackTypeItem: event.snackType),
//   );
// }
}
