part of 'snack_collections_bloc.dart';


class SnackCollectionsState extends Equatable {
  final List<SnackItemModel> favouriteProductList;

  const SnackCollectionsState({
    this.favouriteProductList = const [],
  });

  SnackCollectionsState copyWith({
    List<SnackItemModel>? favouriteProductList,
  }) {
    return SnackCollectionsState(
      favouriteProductList:favouriteProductList!=null ? [...favouriteProductList] : this.favouriteProductList,
    );
  }

  @override
  List<Object?> get props => [
    favouriteProductList,
  ];
}

