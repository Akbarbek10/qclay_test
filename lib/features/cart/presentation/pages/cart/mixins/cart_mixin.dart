part of 'package:qclay_test/features/cart/presentation/pages/cart/cart_page.dart';

mixin CartMixin {
  late CartBloc _bloc;

  _initState(BuildContext context) {
    _bloc = context.read<CartBloc>();

  }

  _dispose() {
    _bloc.close();
  }
}

