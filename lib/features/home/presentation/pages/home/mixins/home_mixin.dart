part of 'package:qclay_test/features/home/presentation/pages/home/home_page.dart';

mixin HomeMixin {
  late HomeBloc _bloc;
  late List<SnackItemModel> _allList;
  late List<SnackItemModel> _chipsList;
  late List<SnackItemModel> _chocoList;
  late List<SnackItemModel> _sweetsList;

  void _initState(BuildContext context) {
    _bloc = context.read<HomeBloc>();
    _initLists();
  }

  void _initLists() {
    _allList = [
      SnackItemModel(
        backgroundColor: ThemeColors.allCardColor,
        type: "All",
        imageUrl: "assets/png/ice_cream.png",
        cartImgUrl: "assets/png/ice_cream_cart.png",
        price: "0.9",
        name: "Good\nSource",
      ),
      SnackItemModel(
        backgroundColor: ThemeColors.allCardColor,
        type: "All",
        imageUrl: "assets/png/ice_cream.png",
        cartImgUrl: "assets/png/ice_cream_cart.png",
        price: "0.9",
        name: "Good\nSource",
      ),
    ];
    _chipsList = [
      SnackItemModel(
        backgroundColor: ThemeColors.chipsCardColor,
        type: "Chips",
        imageUrl: "assets/png/chips_card.png",
        cartImgUrl: "assets/png/ice_cream_cart.png",
        price: "0.9",
        name: "Smith\nChips",
      ),
      SnackItemModel(
        backgroundColor: ThemeColors.chipsCardColor,
        type: "Chips",
        imageUrl: "assets/png/chips_card.png",
        cartImgUrl: "assets/png/ice_cream_cart.png",
        price: "0.9",
        name: "Smith\nChips",
      ),
      SnackItemModel(
        backgroundColor: ThemeColors.chipsCardColor,
        type: "Chips",
        imageUrl: "assets/png/chips_card.png",
        cartImgUrl: "assets/png/ice_cream_cart.png",
        price: "0.9",
        name: "Smith\nChips",
      ),
      SnackItemModel(
        backgroundColor: ThemeColors.chipsCardColor,
        type: "Chips",
        imageUrl: "assets/png/chips_card.png",
        cartImgUrl: "assets/png/ice_cream_cart.png",
        price: "0.9",
        name: "Smith\nChips",
      ),
    ];
    _chocoList = [
      SnackItemModel(
        backgroundColor: ThemeColors.chocoSnackColorPink,
        type: "Chocolate",
        imageUrl: "assets/png/choco.png",
        price: "0.8",
        cartImgUrl: "assets/png/choco_cart.png",
        name: "Good\nSource",
      ),
      SnackItemModel(
        backgroundColor: ThemeColors.chocoSnackColorPink,
        type: "Chocolate",
        imageUrl: "assets/png/choco.png",
        price: "0.8",
        cartImgUrl: "assets/png/choco_cart.png",
        name: "Good\nSource",
      ),
      SnackItemModel(
        backgroundColor: ThemeColors.chocoSnackColorPink,
        type: "Chocolate",
        imageUrl: "assets/png/choco.png",
        price: "0.8",
        cartImgUrl: "assets/png/choco_cart.png",
        name: "Good\nSource",
      ),
    ];
    _sweetsList = [
      SnackItemModel(
        backgroundColor: ThemeColors.sweetsCardColor,
        type: "Sweet",
        imageUrl: "assets/png/chips.png",
        price: "0.7",
        cartImgUrl: "assets/png/ice_cream_cart.png",
        name: "Smiths\nSweets",
      ),
      SnackItemModel(
        backgroundColor: ThemeColors.sweetsCardColor,
        type: "Sweet",
        imageUrl: "assets/png/chips.png",
        price: "0.7",
        cartImgUrl: "assets/png/ice_cream_cart.png",
        name: "Smiths\nSweets",
      ),
      SnackItemModel(
        backgroundColor: ThemeColors.sweetsCardColor,
        type: "Sweet",
        imageUrl: "assets/png/chips.png",
        price: "0.7",
        cartImgUrl: "assets/png/ice_cream_cart.png",
        name: "Smiths\nSweets",
      ),
    ];
    _bloc.add(SetSnacksListEvent(currentSnacksList: _chocoList));
  }

  _dispose() {
    _bloc.close();
  }
}
