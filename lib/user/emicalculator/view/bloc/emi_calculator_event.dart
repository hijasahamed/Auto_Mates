part of 'emi_calculator_bloc.dart';

@immutable
sealed class EmiCalculatorEvent {}

class LoanAmountSliderRefreshEvent extends EmiCalculatorEvent {}

class EmiPerMonthValueRefreshEvent extends EmiCalculatorEvent {
  final double emiPayable;
  EmiPerMonthValueRefreshEvent({required this.emiPayable});
}

class EmiLoadingEvent extends EmiCalculatorEvent {}