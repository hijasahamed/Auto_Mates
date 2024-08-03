// ignore_for_file: must_be_immutable

part of 'buy_screen_bloc.dart';

@immutable
abstract class BuyScreenEvent {}

class InterstButtonClickedRebuildUiEvent  extends BuyScreenEvent {}

class FavouriteButtonClickedRebuildUiEvent  extends BuyScreenEvent {}

class FilterButtonClickedEvent extends BuyScreenEvent {}

class CarBrandFilterStateRefreshEvent extends BuyScreenEvent {
  final String selectedCar;
  final int index;
  CarBrandFilterStateRefreshEvent({required this.selectedCar,required this.index});
}

class CarFuelFilterDropDownStateChangeEvent extends BuyScreenEvent {
 final bool isDropdownVisible;
 CarFuelFilterDropDownStateChangeEvent({required this.isDropdownVisible});
}

class CarFuelFilterStateRefreshEvent extends BuyScreenEvent {
  final String selectedFuel;
  final int index;
  CarFuelFilterStateRefreshEvent({required this.selectedFuel,required this.index});
}

class CarTransmissionFilterStateRefreshEvent extends BuyScreenEvent {
  final String selectedTransmission;
  final int index;
  CarTransmissionFilterStateRefreshEvent({required this.selectedTransmission,required this.index});
}

class CarSeatFilterStateRefreshEvent extends BuyScreenEvent {
  final int index;
  final String seat;
  CarSeatFilterStateRefreshEvent({required this.index,required this.seat});
}

class CarBudgetFilterStateRefreshEvent extends BuyScreenEvent {
  final int index;
  final String budgetText;
  CarBudgetFilterStateRefreshEvent({required this.index,required this.budgetText});
}

class ShowAllCarImagesEvent extends BuyScreenEvent{}

class AllImageIndexCheckingEvent extends BuyScreenEvent{}

class ImageZoomingScreenNavigateEvent extends BuyScreenEvent{
  int index;
  ImageZoomingScreenNavigateEvent({required this.index});
}

class TabBarViewRefreshEvent extends BuyScreenEvent{}

class SellerAddedToFavouriteButtonRefreshEvent extends BuyScreenEvent{}

class FilterdCarDropdownButtonRefreshEvent extends BuyScreenEvent {
 final bool isDropdownVisible;
 final int index;
 FilterdCarDropdownButtonRefreshEvent({required this.isDropdownVisible,required this.index});
}

class ApplyFilterButtonTextRefreshEvent extends BuyScreenEvent{}

class RefreshIntrestedAutoTimerEvent extends BuyScreenEvent{}

class InterestButtoncircularLoaderEvent extends BuyScreenEvent{}

class CarAddingToFeaturedEvent extends BuyScreenEvent{}