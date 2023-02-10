part of 'home_bloc.dart';

class HomeState extends Equatable {
  final SnackTypes selectedSnackTypeItem;

  const HomeState({
    required this.selectedSnackTypeItem,
  });

  HomeState copyWith({
    SnackTypes? selectedSnackTypeItem,
  }) {
    return HomeState(
      selectedSnackTypeItem:
          selectedSnackTypeItem ?? this.selectedSnackTypeItem,
    );
  }

  @override
  List<Object?> get props => [
        selectedSnackTypeItem,
      ];
}
