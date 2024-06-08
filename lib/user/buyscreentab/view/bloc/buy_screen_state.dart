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

class CarFuelFilterDropDownStateChangeState extends BuyScreenState {}