part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

// class SnackTypeSelectedEvent extends ProductEvent {
//   final SnackTypes snackType;
//
//   const SnackTypeSelectedEvent({required this.snackType});
//
//   @override
//   List<Object?> get props => [snackType];
// }
