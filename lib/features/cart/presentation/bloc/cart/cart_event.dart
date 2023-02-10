part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

// class SnackTypeSelectedEvent extends CartEvent {
//   final SnackTypes snackType;
//
//   const SnackTypeSelectedEvent({required this.snackType});
//
//   @override
//   List<Object?> get props => [snackType];
// }
