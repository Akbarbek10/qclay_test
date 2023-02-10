part of 'product_bloc.dart';

class ProductState extends Equatable {
  final String? product;

  const ProductState({
     this.product,
  });

  ProductState copyWith({
    String? product,
  }) {
    return ProductState(
      product: product ?? this.product,
    );
  }

  @override
  List<Object?> get props => [
        product,
      ];
}
