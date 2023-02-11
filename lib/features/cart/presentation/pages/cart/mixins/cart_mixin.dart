part of 'package:qclay_test/features/cart/presentation/pages/cart/cart_page.dart';

mixin CartMixin {
  late CartBloc _bloc;
  late AnimationController _firstController;
  late AnimationController _secondController;
  late AnimationController _thirdController;
  late AnimationController _forthController;
  late AnimationController _fifthController;
  late AnimationController _sixthController;

  _initState(BuildContext context, TickerProvider ticker) {
    _bloc = context.read<CartBloc>();
    _initControllers(ticker);
    _startTransitions();
  }

  _initControllers(TickerProvider ticker) {
    _firstController = AnimationController(
        vsync: ticker, duration: const Duration(milliseconds: 300));
    _secondController = AnimationController(
        vsync: ticker, duration: const Duration(milliseconds: 300));
    _thirdController = AnimationController(
        vsync: ticker, duration: const Duration(milliseconds: 300));
    _forthController = AnimationController(
        vsync: ticker, duration: const Duration(milliseconds: 300));
    _fifthController = AnimationController(
        vsync: ticker, duration: const Duration(milliseconds: 300));
    _sixthController = AnimationController(
        vsync: ticker, duration: const Duration(milliseconds: 500));
  }

  void _startTransitions() async {
    await _firstController.forward();
    await _secondController.forward();
    await _thirdController.forward();
    _forthController.forward();
    await Future.delayed(const Duration(milliseconds: 100));
    await _fifthController.forward();
    await _sixthController.forward();
  }

  _dispose() {
    _bloc.close();
  }
}
