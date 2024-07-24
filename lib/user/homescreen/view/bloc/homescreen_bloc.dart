import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homescreen_event.dart';
part 'homescreen_state.dart';

class HomescreenBloc extends Bloc<HomescreenEvent, HomescreenState> {
  HomescreenBloc() : super(HomescreenInitial()) {
    on<TopSellersAllListNavigateEvent>(topSellersAllListNavigateEvent);
  }

  FutureOr<void> topSellersAllListNavigateEvent(
    TopSellersAllListNavigateEvent event, Emitter<HomescreenState> emit) {
      emit(TopSellersAllListNavigateState());
  }
}
