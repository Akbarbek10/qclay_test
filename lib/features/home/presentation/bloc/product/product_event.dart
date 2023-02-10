part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class IncreaseQuantityEvent extends ProductEvent {
  const IncreaseQuantityEvent();

  @override
  List<Object?> get props => [];
}

class DecreaseQuantityEvent extends ProductEvent {
  const DecreaseQuantityEvent();

  @override
  List<Object?> get props => [];
}
