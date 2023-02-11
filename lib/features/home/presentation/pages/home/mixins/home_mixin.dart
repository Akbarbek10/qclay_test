part of 'package:qclay_test/features/home/presentation/pages/home/home_page.dart';

mixin HomeMixin {
  late HomeBloc _bloc;
  final List<SnackItemModel> _allList = [];
  final List<SnackItemModel> _chipsList = [];
  final List<SnackItemModel> _chocoList = [];
  final List<SnackItemModel> _sweetsList = [];
  late AnimationController _transitionController;

  void _initState(BuildContext context, TickerProvider ticker) {
    _bloc = context.read<HomeBloc>();
    _initLists();
    _initTransitions(ticker);
  }

  _initTransitions(TickerProvider ticker) {
    _transitionController = AnimationController(
      vsync: ticker,
      duration: const Duration(milliseconds: 500),
    );
    _transitionController.forward();
  }

  void _initLists() {
    for (int i = 0; i < 5; i++) {
      _allList.add(
        SnackItemModel(
          index: i,
          backgroundColor: ThemeColors.allCardColor,
          type: "All",
          imageUrl: "assets/png/ice_cream.png",
          cartImgUrl: "assets/png/ice_cream_cart.png",
          price: "0.9",
          name: "Good\nSource",
        ),
      );

      _chipsList.add(
        SnackItemModel(
          index: i,
          backgroundColor: ThemeColors.chipsCardColor,
          type: "Chips",
          imageUrl: "assets/png/chips_card.png",
          cartImgUrl: "assets/png/ice_cream_cart.png",
          price: "0.9",
          name: "Smith\nChips",
        ),
      );

      _chocoList.add(
        SnackItemModel(
          index: i,
          backgroundColor: ThemeColors.chocoSnackColorPink,
          type: "Chocolate",
          imageUrl: "assets/png/choco.png",
          price: "0.8",
          cartImgUrl: "assets/png/choco_cart.png",
          name: "Good\nSource",
        ),
      );
      _sweetsList.add(
        SnackItemModel(
          index: i,
          backgroundColor: ThemeColors.sweetsCardColor,
          type: "Sweet",
          imageUrl: "assets/png/chips.png",
          price: "0.7",
          cartImgUrl: "assets/png/ice_cream_cart.png",
          name: "Smiths\nSweets",
        ),
      );
    }
    _bloc.add(SetSnacksListEvent(currentSnacksList: _chocoList));
  }

  _dispose() {
    _bloc.close();
  }
}
