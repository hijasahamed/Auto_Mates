import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'seller_home_screen_event.dart';
part 'seller_home_screen_state.dart';

class SellerHomeScreenBloc extends Bloc<SellerHomeScreenEvent, SellerHomeScreenState> {
  SellerHomeScreenBloc() : super(SellerHomeScreenInitial()) {
    on<FloatingButtonClickedEvent>(floatingButtonClickedEvent);
  }

  FutureOr<void> floatingButtonClickedEvent(
    FloatingButtonClickedEvent event, Emitter<SellerHomeScreenState> emit) {
      emit(FloatingButtonClickedActionState());
  }
}
