part of 'home_bloc.dart';

class HomeState extends Equatable {
  final SnackTypes selectedSnackTypeItem;
  final List<SnackItemModel> cartItems;

  const HomeState({
    required this.selectedSnackTypeItem,
    this.cartItems = const [],
  });

  HomeState copyWith({
    SnackTypes? selectedSnackTypeItem,
    List<SnackItemModel>? cartItems,
  }) {
    return HomeState(
        cartItems: cartItems ?? this.cartItems,
        selectedSnackTypeItem:
            selectedSnackTypeItem ?? this.selectedSnackTypeItem);
  }

  @override
  List<Object?> get props => [
        selectedSnackTypeItem,
        cartItems,
      ];
}
