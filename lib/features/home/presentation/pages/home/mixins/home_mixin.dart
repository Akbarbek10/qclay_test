part of 'package:qclay_test/features/home/presentation/pages/home/home_page.dart';

mixin HomeMixin {
  late HomeBloc _bloc;
  late List<List<SnackItemModel>> _snacksList;
  late List<SnackItemModel> _allList;
  late List<SnackItemModel> _chipsList;
  late List<SnackItemModel> _chocoList;
  late List<SnackItemModel> _sweetsList;

  void _initState(BuildContext context) {
    _bloc = context.read<HomeBloc>();

    _initLists();

  }

  void _initLists(){
    _allList = [
      SnackItemModel(
        backgroundColor: ThemeColors.chocoSnackColorPink,
        type: "All",
        imageUrl: "assets/png/choco.png",
        cartImgUrl: "assets/png/ice_cream_cart.png",
        price: "0.9",
        name: "Good\nSource",
      ),
      SnackItemModel(
        backgroundColor: ThemeColors.chocoSnackColorPink,
        type: "All",
        imageUrl: "assets/png/choco.png",
        cartImgUrl: "assets/png/ice_cream_cart.png",
        price: "0.9",
        name: "Good\nSource",
      ),
    ];
    _chipsList = [
      SnackItemModel(
        backgroundColor: ThemeColors.chocoSnackColorPink,
        type: "All",
        imageUrl: "assets/png/choco.png",
        cartImgUrl: "assets/png/ice_cream_cart.png",
        price: "0.9",
        name: "Good\nSource",
      ),
      SnackItemModel(
        backgroundColor: ThemeColors.chocoSnackColorPink,
        type: "All",
        imageUrl: "assets/png/choco.png",
        cartImgUrl: "assets/png/ice_cream_cart.png",
        price: "0.9",
        name: "Good\nSource",
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
    ];
    _sweetsList = [
      SnackItemModel(
        type: "Sweet",
        imageUrl: "assets/png/chips.png",
        price: "0.7",
        cartImgUrl: "assets/png/ice_cream_cart.png",
        name: "Smiths\nSweets",
      ),
      SnackItemModel(
        type: "Sweet",
        imageUrl: "assets/png/chips.png",
        price: "0.7",
        cartImgUrl: "assets/png/ice_cream_cart.png",
        name: "Smiths\nSweets",
      ),
    ];
    _snacksList = [
      [..._allList],
      [..._chipsList],
      [..._chocoList],
      [..._sweetsList],
    ];

    _bloc.add(InitSnacksListEvent(snacksList: _snacksList));

  }


  _dispose() {
    _bloc.close();
  }
}
