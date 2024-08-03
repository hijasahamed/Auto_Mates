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
  final String seat;
  CarSeatFilterStateRefreshState({required this.index,required this.seat});
}

class CarBudgetFilterStateRefreshState extends BuyScreenState{
  final int index;
  final String budgetText;
  CarBudgetFilterStateRefreshState({required this.index,required this.budgetText});
}

class ShowAllCarImagesState extends BuyScreenState{}

class AllImageIndexCheckingState extends BuyScreenState{}

class ImageZoomingScreenNavigateState extends BuyScreenState{
  int index;
  ImageZoomingScreenNavigateState({required this.index});
}

class TabBarViewRefreshState extends BuyScreenState{}

class SellerAddedToFavouriteButtonRefreshState extends BuyScreenState{}

class FilterdCarDropdownButtonRefreshState extends BuyScreenState {
  final bool isDropdownVisible;
  final int index;
  FilterdCarDropdownButtonRefreshState({required this.isDropdownVisible,required this.index});
}

class ApplyFilterButtonTextRefreshState extends BuyScreenState{}

class RefreshIntrestedAutoTimerState extends BuyScreenState{}

class InterestButtoncircularLoaderState extends BuyScreenState{}

class CarAddingToFeaturedState extends BuyScreenState{}