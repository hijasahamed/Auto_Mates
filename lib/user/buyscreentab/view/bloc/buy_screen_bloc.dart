import 'dart:async';

import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/dropdownbuttons/car_brand_drop_down.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_cars/car_brands/filter_with_car_brands.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'buy_screen_event.dart';
part 'buy_screen_state.dart';

class BuyScreenBloc extends Bloc<BuyScreenEvent, BuyScreenState> {
  BuyScreenBloc() : super(BuyScreenInitial()) {
    on<InterstButtonClickedRebuildUiEvent>(interestedCarConatinerClickedEvent);
    on<FavouriteButtonClickedRebuildUiEvent>(favouriteButtonClickedRebuildUiEvent);
    on<FilterButtonClickedEvent>(filterButtonClickedEvent);
    on<CarBrandFilterStateRefreshEvent>(carBrandFilterStateRefreshEvent);
    on<CarFuelFilterDropDownStateChangeEvent>(carFuelFilterDropDownStateChangeEvent);
  }

  FutureOr<void> interestedCarConatinerClickedEvent(
    InterstButtonClickedRebuildUiEvent event, Emitter<BuyScreenState> emit) {
      emit(InterstButtonClickedRebuildUiState());
  }

  FutureOr<void> favouriteButtonClickedRebuildUiEvent(
    FavouriteButtonClickedRebuildUiEvent event, Emitter<BuyScreenState> emit) {
      emit(FavouriteButtonClickedRebuildUiState());
  }

  FutureOr<void> filterButtonClickedEvent(
    FilterButtonClickedEvent event, Emitter<BuyScreenState> emit) {
      emit(FilterButtonClickedState());
  }

  FutureOr<void> carBrandFilterStateRefreshEvent(
    CarBrandFilterStateRefreshEvent event, Emitter<BuyScreenState> emit) {
      emit(CarBrandFilterStateRefreshState(selectedCar: event.selectedCar,index: event.index));
        if(!selectedCarBrandsList.contains(carBrands[event.index])){
          selectedCarBrandsList.add(event.selectedCar); 
        }else{
          selectedCarBrandsList.remove(event.selectedCar);
        }
  }

  FutureOr<void> carFuelFilterDropDownStateChangeEvent(
    CarFuelFilterDropDownStateChangeEvent event, Emitter<BuyScreenState> emit) {
      emit(CarFuelFilterDropDownStateChangeState());
  }
}
