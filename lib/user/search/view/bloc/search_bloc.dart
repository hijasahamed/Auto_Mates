import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<AddingCarForCompareSearchScreenRefreshEvent>(addingCarForCompareSearchScreenRefreshEvent);
  }

  FutureOr<void> addingCarForCompareSearchScreenRefreshEvent(
    AddingCarForCompareSearchScreenRefreshEvent event, Emitter<SearchState> emit) {
      emit(AddingCarForCompareSearchScreenRefreshState());
  }
}
