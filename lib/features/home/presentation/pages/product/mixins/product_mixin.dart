part of 'package:qclay_test/features/home/presentation/pages/product/product_page.dart';

mixin ProductMixin {
  late ProductBloc _bloc;
  late AnimationController _firstController;
  late AnimationController _secondController;
  late AnimationController _cartController;

  _initState(BuildContext context, TickerProvider ticker) {
    _bloc = context.read<ProductBloc>();

    _firstController = AnimationController(
        vsync: ticker, duration: const Duration(milliseconds: 800));
    _secondController = AnimationController(
        vsync: ticker, duration: const Duration(milliseconds: 800));
    _cartController = AnimationController(
        vsync: ticker, duration: const Duration(milliseconds: 800));

    _starTransitions();
  }

  _starTransitions() async {
    _firstController.forward();
    await Future.delayed(const Duration(milliseconds: 600));
    _secondController.forward();
    await Future.delayed(const Duration(milliseconds: 1000));
    _cartController.forward();
  }

  _dispose() {
    _bloc.close();
  }
}
