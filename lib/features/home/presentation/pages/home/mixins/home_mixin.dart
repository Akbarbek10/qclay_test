part of 'package:qclay_test/features/home/presentation/pages/home/home_page.dart';

mixin HomeMixin {
  late HomeBloc _bloc;

  _initState(BuildContext context) {
    _bloc = context.read<HomeBloc>();
  }

  _dispose(){
    _bloc.close();
  }
}
