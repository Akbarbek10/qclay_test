part of 'home_bloc.dart';

class HomeState extends Equatable {
  final SnackTypes selectedSnackTypeItem;
  final List<SnackItemModel> cartItems;
  final Offset cardItemPosition;
  final bool? isCardDragging;
  final Size? size;
  final double? cardAngle;
  final List<SnackItemModel> currentSnacksList;

  const HomeState({
    this.size,
    this.cardAngle = 0,
    required this.selectedSnackTypeItem,
    required this.cardItemPosition,
    this.isCardDragging = false,
    this.cartItems = const [],
    this.currentSnacksList = const [],
  });

  HomeState copyWith(
      {SnackTypes? selectedSnackTypeItem,
      List<SnackItemModel>? cartItems,
      Offset? cardItemPosition,
      Size? size,
      List<SnackItemModel>? currentSnacksList,
      double? cardAngle,
      bool? isCardDragging}) {
    return HomeState(
        isCardDragging: isCardDragging ?? this.isCardDragging,
        size: size ?? this.size,
        currentSnacksList: currentSnacksList!=null ?  [...currentSnacksList]: this.currentSnacksList,
        cardAngle: cardAngle ?? this.cardAngle,
        cartItems: cartItems ?? this.cartItems,
        cardItemPosition: cardItemPosition ?? this.cardItemPosition,
        selectedSnackTypeItem:
            selectedSnackTypeItem ?? this.selectedSnackTypeItem);
  }

  @override
  List<Object?> get props => [
        currentSnacksList,
        selectedSnackTypeItem,
        cartItems,
        cardItemPosition,
        isCardDragging,
        size,
        cardAngle,
      ];
}
