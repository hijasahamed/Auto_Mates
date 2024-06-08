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

class CarFuelFilterDropDownStateChangeEvent extends BuyScreenEvent {}