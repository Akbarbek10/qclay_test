import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qclay_test/features/home/presentation/pages/home/models/snack_item_model.dart';

part 'home_event.dart';

part 'home_state.dart';

enum SnackTypes { all, choco, chips, sweets }

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(
          const HomeState(
            selectedSnackTypeItem: SnackTypes.choco,
            cardItemPosition: Offset.zero,
          ),
        ) {
    on<SnackTypeSelectedEvent>(_onSnackTypeSelected);
    on<AddSnackToCartEvent>(_onAddSnackToCart);
    on<StartPositionEvent>(_onStartPosition);
    on<UpdatePositionEvent>(_onUpdatePosition);
    on<EndPositionEvent>(_onEndPosition);
    on<SetSizeEvent>(_onSizeSet);
    on<InitSnacksListEvent>(_onInitSnacksList);
  }

  _onSnackTypeSelected(SnackTypeSelectedEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      selectedSnackTypeItem: event.snackType,
    ));
  }

  _onAddSnackToCart(AddSnackToCartEvent event, Emitter<HomeState> emit) {
    var cartItems = [...state.cartItems];
    cartItems.add(event.snack!);
    if (cartItems.length > 3) {
      cartItems.removeAt(0);
      emit(state.copyWith(cartItems: cartItems));
      return;
    }
    emit(
      state.copyWith(cartItems: cartItems),
    );
  }

  _onStartPosition(StartPositionEvent event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
        isCardDragging: true,
      ),
    );
  }

  _onUpdatePosition(UpdatePositionEvent event, Emitter<HomeState> emit) {
    var position = state.cardItemPosition;
    position += event.details.delta;
    var x = position.dx;
    var y = position.dy;
    var sizeWidth = state.size?.width;
    var angle = -45 * x / sizeWidth!;

    if (y < -30) {
      return;
    }

    emit(
      state.copyWith(
        cardItemPosition: position,
        cardAngle: angle,
      ),
    );
  }

  Future<void> _nextCard(Emitter<HomeState> emit) async {
    int index = state.selectedSnackTypeItem.index;
    var list = state.snacksList![index];

    if (list.isEmpty) {
      return;
    }
    list.removeLast();
    var snacksList = [...?state.snacksList];
    snacksList[index] = list;

    emit(state.copyWith(snacksList: snacksList));
  }

  _onEndPosition(EndPositionEvent event, Emitter<HomeState> emit) {
    var y = state.cardItemPosition.dy;
    emit(
      state.copyWith(isCardDragging: false),
    );
    if (y <= -20) {
      _swipeLeftRight(emit);
      return;
    }
    _resetPosition(emit);
  }

  _resetPosition(Emitter<HomeState> emit) {
    emit(
      state.copyWith(
          isCardDragging: false, cardItemPosition: Offset.zero, cardAngle: 0),
    );
  }

  _onInitSnacksList(InitSnacksListEvent event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
        snacksList: [...event.snacksList],
      ),
    );
  }

  _onSizeSet(SetSizeEvent event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
        size: event.size,
      ),
    );
  }

  _swipeLeftRight(
    Emitter<HomeState> emit,
  ) {
    var angle = 20.0;
    var sizeWidth = state.size?.width;
    var position = state.cardItemPosition;
    var x = position.dx;

    if (x < 0) {
      position += Offset(-2 * sizeWidth!, 0);
    }
    if (x > 0) {
      position += Offset(2 * sizeWidth!, 0);
    }
    emit(
      state.copyWith(
        cardItemPosition: position,
        cardAngle: angle,
      ),
    );
    _nextCard(emit);
  }
}
