part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class SnackTypeSelectedEvent extends HomeEvent {
  final SnackTypes snackType;

  const SnackTypeSelectedEvent({
    required this.snackType,
  });

  @override
  List<Object?> get props => [
        snackType,
      ];
}

class AddSnackToCartEvent extends HomeEvent {
  final SnackItemModel? snack;

  const AddSnackToCartEvent({required this.snack});

  @override
  List<Object?> get props => [
        snack,
      ];
}

class StartPositionEvent extends HomeEvent {
  final DragStartDetails details;

  const StartPositionEvent({required this.details});

  @override
  List<Object?> get props => [details];
}

class UpdatePositionEvent extends HomeEvent {
  final DragUpdateDetails details;

  const UpdatePositionEvent({required this.details});

  @override
  List<Object?> get props => [details];
}

class EndPositionEvent extends HomeEvent {
  const EndPositionEvent();

  @override
  List<Object?> get props => [];
}

class SetSizeEvent extends HomeEvent {
  final Size size;

  const SetSizeEvent({required this.size});

  @override
  List<Object?> get props => [size];
}

class SetSnacksListEvent extends HomeEvent {
  final List<SnackItemModel> currentSnacksList;

  const SetSnacksListEvent({required this.currentSnacksList});

  @override
  List<Object?> get props => [
        currentSnacksList,
      ];
}
