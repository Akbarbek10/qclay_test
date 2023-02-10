part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class SnackTypeSelectedEvent extends HomeEvent {
  final SnackTypes snackType;

  const SnackTypeSelectedEvent({required this.snackType});

  @override
  List<Object?> get props => [snackType];
}
