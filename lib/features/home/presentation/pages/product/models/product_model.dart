import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final num? price;
  final num? quantity;

  num get totalSum => (price! * quantity!);

  const ProductModel({
    this.quantity = 1,
    this.price = 6.25,
  });

  ProductModel copyWith({
    num? price,
    num? quantity,
  }) {
    return ProductModel(
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [
        price,
        quantity,
      ];
}
