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
        price: "0.8",
        name: "Good\nSource",
      ),
      SnackItemModel(
        backgroundColor:  ThemeColors.chocoSnackColorPink,
        type: "Chocolate",
        imageUrl: "assets/png/choco.png",
        price: "0.8",
        name: "Good\nSource",
      ),
      SnackItemModel(
        backgroundColor:  ThemeColors.chipsSnackColorGreen,
        type: "Chips",
        imageUrl: "assets/png/chips.png",
        price: "0.3",
        name: "Smiths\nChips",
      ),
      SnackItemModel(
        type: "Sweet",
        imageUrl: "assets/png/chips.png",
        price: "0.7",
        name: "Smiths\nSweets",
      ),
    ];
  }

  _dispose() {
    _bloc.close();
  }
}

class SnackItemModel {
  final String? type;
  final String? imageUrl;
  final String? price;
  final String? name;
  final Color? backgroundColor;

  SnackItemModel({
    this.type,
    this.imageUrl,
    this.price,
    this.name,
    this.backgroundColor,
  });
}
