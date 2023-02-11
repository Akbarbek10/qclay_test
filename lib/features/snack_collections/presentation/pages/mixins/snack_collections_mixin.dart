part of 'package:qclay_test/features/snack_collections/presentation/pages/snack_collections_page.dart';

mixin SnackCollectionsMixin {
  late SnackCollectionsBloc _bloc;
  late List<SnackItemModel> _productList;
  late List<SnackItemModel> _productListReversed;
  late AnimationController _headerController;
  late AnimationController _leftListController;
  late AnimationController _rightListController;

  _initState(BuildContext context, TickerProvider ticker) {
    _bloc = context.read<SnackCollectionsBloc>();
    _headerController = AnimationController(
      vsync: ticker,
      duration: const Duration(milliseconds: 500),
    );
    _leftListController = AnimationController(
      vsync: ticker,
      duration: const Duration(milliseconds: 500),
    );
    _rightListController = AnimationController(
      vsync: ticker,
      duration: const Duration(milliseconds: 500),
    );

    _headerController.forward();
    _headerController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
          _leftListController.forward();
      }
    });

    _leftListController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _rightListController.forward();
      }
    });



    _loadProductList();
  }

  _dispose() {
    _headerController.dispose();
    _leftListController.dispose();
    _rightListController.dispose();
    _bloc.close();
  }

  void _loadProductList() {
    _productList = [
      const SnackItemModel(
        type: "Chips",
        imageUrl: "assets/png/chips_collection/snack_1.png",
        price: "7.00",
        backgroundColor: Color(0xFFFFE8AE),
        name: "Smiths\nSweets",
      ),
      const SnackItemModel(
        type: "Chips",
        imageUrl: "assets/png/chips_collection/snack_2.png",
        price: "8.00",
        backgroundColor:Color(0xFFF2E1D5),
        name: "Dark\nRusset",
      ),
      const SnackItemModel(
        type: "Chips",
        imageUrl: "assets/png/chips_collection/snack_3.png",
        price: "6.00",
        backgroundColor:Color(0xFFFFCDCA),
        name: "Twister\nChips",
      ),
      const SnackItemModel(
        type: "Chips",
        imageUrl: "assets/png/chips_collection/snack_4.png",
        price: "7.50",
        backgroundColor:Color(0xFFEAFCD7),
        name: "Coconut\nChips",
      ),
      const SnackItemModel(
        type: "Chips",
        imageUrl: "assets/png/chips_collection/snack_5.png",
        price: "9.20",
        backgroundColor:Color(0xFFE7E9FF),
        name: "Regular\nNature",
      ),
      const SnackItemModel(
        type: "Chips",
        imageUrl: "assets/png/chips_collection/snack_6.png",
        price: "5.75",
        backgroundColor:Color(0xFFDDCDFE),
        name: "Deep\nRiver",
      ),
    ];
    _productListReversed = _productList.reversed.toList();
  }
  
  
}
