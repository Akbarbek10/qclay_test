import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'snack_collections_event.dart';
part 'snack_collections_state.dart';

class SnackCollectionsBloc extends Bloc<SnackCollectionsEvent, SnackCollectionsState> {
  SnackCollectionsBloc() : super(SnackCollectionsInitial()) {
    on<SnackCollectionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
