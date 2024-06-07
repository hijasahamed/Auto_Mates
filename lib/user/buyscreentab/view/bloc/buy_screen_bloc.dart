import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'buy_screen_event.dart';
part 'buy_screen_state.dart';

class BuyScreenBloc extends Bloc<BuyScreenEvent, BuyScreenState> {
  BuyScreenBloc() : super(BuyScreenInitial()) {
    on<InterstButtonClickedRebuildUiEvent>(interestedCarConatinerClickedEvent);
    on<FavouriteButtonClickedRebuildUiEvent>(favouriteButtonClickedRebuildUiEvent);
    on<FilterButtonClickedEvent>(filterButtonClickedEvent);
  }

  FutureOr<void> interestedCarConatinerClickedEvent(
    InterstButtonClickedRebuildUiEvent event, Emitter<BuyScreenState> emit) {
      emit(InterstButtonClickedRebuildUiState());
  }

  FutureOr<void> favouriteButtonClickedRebuildUiEvent(
    FavouriteButtonClickedRebuildUiEvent event, Emitter<BuyScreenState> emit) {
      emit(FavouriteButtonClickedRebuildUiState());
  }

  FutureOr<void> filterButtonClickedEvent(
    FilterButtonClickedEvent event, Emitter<BuyScreenState> emit) {
      emit(FilterButtonClickedState());
  }
}
