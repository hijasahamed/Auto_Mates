import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'emi_calculator_event.dart';
part 'emi_calculator_state.dart';

class EmiCalculatorBloc extends Bloc<EmiCalculatorEvent, EmiCalculatorState> {
  EmiCalculatorBloc() : super(EmiCalculatorInitial()) {
    on<LoanAmountSliderRefreshEvent>(loanAmountSliderRefreshEvent);
    on<EmiPerMonthValueRefreshEvent>(emiPerMonthValueRefreshEvent);
    on<EmiLoadingEvent>(emiLoadingEvent);
  }

  FutureOr<void> loanAmountSliderRefreshEvent(
    LoanAmountSliderRefreshEvent event, Emitter<EmiCalculatorState> emit) {
      emit(LoanAmountSliderRefreshState());
  }

  FutureOr<void> emiPerMonthValueRefreshEvent(
    EmiPerMonthValueRefreshEvent event, Emitter<EmiCalculatorState> emit) {
      emit(EmiPerMonthValueRefreshState(emiPayable: event.emiPayable));
  }

  FutureOr<void> emiLoadingEvent(
    EmiLoadingEvent event, Emitter<EmiCalculatorState> emit) {
      emit(EmiLoadingState());
  }
}
