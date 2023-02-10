part of 'cart_bloc.dart';

class CartState extends Equatable {
  final String? product;

  const CartState({
    this.product,
  });

  CartState copyWith({
    String? product,
  }) {
    return CartState(
      product: product ?? this.product,
    );
  }

  @override
  List<Object?> get props => [
    product,
  ];
}
