import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'appbottombar_event.dart';
part 'appbottombar_state.dart';

class AppbottombarBloc extends Bloc<AppbottombarEvent, AppbottombarState> {
  AppbottombarBloc() : super(AppbottombarInitial()) {
    on<AppBottomBarInitialEvent>(appBottomBarInitialEvent);
    on<OntapIndexChangeEvent>(ontapIndexChangeEvent);
    on<SearchClickedEvent>(searchClickedEvent);
  }


  FutureOr<void> appBottomBarInitialEvent(
    AppBottomBarInitialEvent event, Emitter<AppbottombarState> emit) async {
      emit(AppbottombarLoadingState());    
      await Future.delayed(const Duration(milliseconds: 2500));
      emit(AppbottombarLoadedSuccessState());
  }

  FutureOr<void> ontapIndexChangeEvent(
    OntapIndexChangeEvent event, Emitter<AppbottombarState> emit) {
      emit(OntapIndexChangeState());
  }


  FutureOr<void> searchClickedEvent(
    SearchClickedEvent event, Emitter<AppbottombarState> emit) {
      emit(SearchClickedActionState());
  }
}
