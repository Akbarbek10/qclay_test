part of 'package:qclay_test/features/home/presentation/pages/home/home_page.dart';

mixin HomeMixin {
  late HomeBloc _bloc;
  late List<SnackItemModel> _snack;

  _initState(BuildContext context) {
    _bloc = context.read<HomeBloc>();
    _snack = [
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
        type: "Chocolate",
        imageUrl: "assets/png/choco.png",
        price: "0.8",
        cartImgUrl: "assets/png/choco_cart.png",
        name: "Good\nSource",
      ),
      SnackItemModel(
        backgroundColor: ThemeColors.chipsSnackColorGreen,
        type: "Chips",
        imageUrl: "assets/png/chips.png",
        price: "0.5",
        cartImgUrl: "assets/png/ice_cream_cart.png",
        name: "Smiths\nChips",
      ),
      SnackItemModel(
        type: "Sweet",
        imageUrl: "assets/png/chips.png",
        price: "0.7",
        cartImgUrl: "assets/png/ice_cream_cart.png",
        name: "Smiths\nSweets",
      ),
    ];
  }

  _dispose() {
    _bloc.close();
  }
}
