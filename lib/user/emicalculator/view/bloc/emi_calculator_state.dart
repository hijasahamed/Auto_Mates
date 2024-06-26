part of 'emi_calculator_bloc.dart';

@immutable
sealed class EmiCalculatorState {
  get emiPayable => null;
}

final class EmiCalculatorInitial extends EmiCalculatorState {}

class LoanAmountSliderRefreshState extends EmiCalculatorState {}

class EmiPerMonthValueRefreshState extends EmiCalculatorState {
  @override
  final double emiPayable;
  EmiPerMonthValueRefreshState({required this.emiPayable});
}

class EmiLoadingState extends EmiCalculatorState {}
