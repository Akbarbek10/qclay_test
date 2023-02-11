import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qclay_test/features/home/presentation/pages/home/models/snack_item_model.dart';

part 'snack_collections_event.dart';

part 'snack_collections_state.dart';

class SnackCollectionsBloc
    extends Bloc<SnackCollectionsEvent, SnackCollectionsState> {
  SnackCollectionsBloc() : super(const SnackCollectionsState()) {
    on<AddProductEvent>(_onProductAdd);
  }

  void _onProductAdd(AddProductEvent event, Emitter emit) {
    List<SnackItemModel> favouriteProductList = [...state.favouriteProductList];
    favouriteProductList.add(event.product);
    emit(state.copyWith(
      favouriteProductList: favouriteProductList,
    ));
  }
}
