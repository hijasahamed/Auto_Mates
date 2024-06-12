// ignore_for_file: must_be_immutable

part of 'buy_screen_bloc.dart';

@immutable
sealed class BuyScreenState {}

final class BuyScreenInitial extends BuyScreenState {}

class InterstButtonClickedRebuildUiState extends BuyScreenState {}

class FavouriteButtonClickedRebuildUiState extends BuyScreenState {}

class FilterButtonClickedState extends BuyScreenState {}

class CarBrandFilterStateRefreshState extends BuyScreenState {
  final String selectedCar;
  final int index;
  CarBrandFilterStateRefreshState({required this.selectedCar,required this.index});
}

class CarFuelFilterDropDownStateChangeState extends BuyScreenState {
  final bool isDropdownVisible;
  CarFuelFilterDropDownStateChangeState({required this.isDropdownVisible});
}

class CarFuelFilterStateRefreshState extends BuyScreenState {
  final String selectedFuel;
  final int index;
  CarFuelFilterStateRefreshState({required this.selectedFuel,required this.index});
}

class CarTransmissionFilterStateRefreshState extends BuyScreenState {
  final String selectedTransmission;
  final int index;
  CarTransmissionFilterStateRefreshState({required this.selectedTransmission,required this.index});
}

class CarSeatFilterStateRefreshState extends BuyScreenState{
  final int index;
  CarSeatFilterStateRefreshState({required this.index});
}

class CarBudgetFilterStateRefreshState extends BuyScreenState{
  final int index;
  final String budgetText;
  CarBudgetFilterStateRefreshState({required this.index,required this.budgetText});
}

class ShowAllCarImagesState extends BuyScreenState{}

class AllImageIndexCheckingState extends BuyScreenState{
  // final int selectedIndex;
  // final int newIndex;
  // AllImageIndexCheckingState({required this.selectedIndex,required this.newIndex});
}