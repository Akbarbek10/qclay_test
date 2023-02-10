import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qclay_test/features/home/presentation/pages/product/models/product_model.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc()
      : super(
          const ProductState(),
        ) {
    on<IncreaseQuantityEvent>(_onQuantityIncreased);
    on<DecreaseQuantityEvent>(_onQuantityDecreased);
  }

// _onSnackTypeSelected(SnackTypeSelectedEvent event, Emitter<ProductState> emit) {
//   emit(
//     state.copyWith(selectedSnackTypeItem: event.snackType),
//   );
// }

  void _onQuantityIncreased(
      IncreaseQuantityEvent event, Emitter<ProductState> emit) {
    var quantity = (state.product.quantity ?? 1) + 1;
    emit(state.copyWith(
      product: state.product.copyWith(
        quantity: quantity,
      ),
    ));
  }

  void _onQuantityDecreased(
      DecreaseQuantityEvent event, Emitter<ProductState> emit) {
    var quantity = (state.product.quantity ?? 1);
    if(quantity<1){
      return;
    }
    quantity-=1;

    emit(state.copyWith(
      product: state.product.copyWith(
        quantity: quantity,
      ),
    ));
  }
}
