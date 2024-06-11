import 'dart:async';

import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/dropdownbuttons/car_brand_drop_down.dart';
import 'package:auto_mates/user/buyscreentab/model/buyscreen_model.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/car_brands/filter_with_car_brands.dart';
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
    on<CarFuelFilterStateRefreshEvent>(carFuelFilterStateRefreshEvent);
    on<CarTransmissionFilterStateRefreshEvent>(carTransmissionFilterStateRefreshEvent);
    on<CarSeatFilterStateRefreshEvent>(carSeatFilterStateRefreshEvent);
    on<CarBudgetFilterStateRefreshEvent>(carBudgetFilterStateRefreshEvent);
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
        if(!selectedCarFilterdList.contains(carBrands[event.index])){
          selectedCarFilterdList.add(event.selectedCar); 
        }else{
          selectedCarFilterdList.remove(event.selectedCar);
        }
  }

  FutureOr<void> carFuelFilterDropDownStateChangeEvent(
    CarFuelFilterDropDownStateChangeEvent event, Emitter<BuyScreenState> emit) {
      emit(CarFuelFilterDropDownStateChangeState(isDropdownVisible: event.isDropdownVisible));
  }


  FutureOr<void> carFuelFilterStateRefreshEvent(
    CarFuelFilterStateRefreshEvent event, Emitter<BuyScreenState> emit) {
      emit(CarFuelFilterStateRefreshState(index: event.index,selectedFuel: event.selectedFuel));
      if(!selectedCarFilterdList.contains(fuelTypes[event.index].fuelType)){
        selectedCarFilterdList.add(event.selectedFuel);
      }else{
        selectedCarFilterdList.remove(event.selectedFuel);
      }
  }

  FutureOr<void> carTransmissionFilterStateRefreshEvent(
    CarTransmissionFilterStateRefreshEvent event, Emitter<BuyScreenState> emit) {
      emit(CarTransmissionFilterStateRefreshState(selectedTransmission: event.selectedTransmission, index: event.index));
      if(!selectedCarFilterdList.contains(transmissionTypes[event.index].transmissionType)){
        selectedCarFilterdList.add(event.selectedTransmission);
      }else{
        selectedCarFilterdList.remove(event.selectedTransmission);
      }
  }

  FutureOr<void> carSeatFilterStateRefreshEvent(
    CarSeatFilterStateRefreshEvent event, Emitter<BuyScreenState> emit) {
      emit(CarSeatFilterStateRefreshState(index: event.index));
      if(!selectedCarFilterdList.contains(seatCapacity[event.index])){
        selectedCarFilterdList.add(seatCapacity[event.index]);
      }else{
        selectedCarFilterdList.remove(seatCapacity[event.index]);
      }
  }

  FutureOr<void> carBudgetFilterStateRefreshEvent(
    CarBudgetFilterStateRefreshEvent event, Emitter<BuyScreenState> emit) {
      emit(CarBudgetFilterStateRefreshState(index: event.index,budgetText: event.budgetText));
      if(!selectedCarFilterdList.contains(event.budgetText)){
        selectedCarFilterdList.add(event.budgetText);
      }else{
        selectedCarFilterdList.remove(event.budgetText);
      }
  }
}
