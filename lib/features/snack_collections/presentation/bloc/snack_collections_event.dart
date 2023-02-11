part of 'snack_collections_bloc.dart';

abstract class SnackCollectionsEvent extends Equatable {
  const SnackCollectionsEvent();
}

class AddProductEvent extends SnackCollectionsEvent {
  final SnackItemModel product;

  const AddProductEvent({required this.product});

  @override
  List<Object?> get props => [
        product,
      ];
}
