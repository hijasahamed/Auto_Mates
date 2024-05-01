import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'appbottombar_event.dart';
part 'appbottombar_state.dart';

class AppbottombarBloc extends Bloc<AppbottombarEvent, AppbottombarState> {
  AppbottombarBloc() : super(AppbottombarInitial()) {
    on<OntapIndexChangeEvent>(ontapIndexChangeEvent);
  }

  FutureOr<void> ontapIndexChangeEvent(
    OntapIndexChangeEvent event, Emitter<AppbottombarState> emit) {
      emit(OntapIndexChangeState());
  }
}
