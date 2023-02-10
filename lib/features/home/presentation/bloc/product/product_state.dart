part of 'product_bloc.dart';

class ProductState extends Equatable {
  final ProductModel product;

  const ProductState({
    this.product = const ProductModel(),
  });

  ProductState copyWith({
    ProductModel? product,
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
