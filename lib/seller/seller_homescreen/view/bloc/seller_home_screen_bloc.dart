import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'seller_home_screen_event.dart';
part 'seller_home_screen_state.dart';

class SellerHomeScreenBloc extends Bloc<SellerHomeScreenEvent, SellerHomeScreenState> {
  SellerHomeScreenBloc() : super(SellerHomeScreenInitial()) {
    on<FloatingButtonClickedEvent>(floatingButtonClickedEvent);
    on<BackArrowClickedEvent>(backArrowClickedEvent);
    on<PostNewCarButtonClickedEvent>(postNewCarButtonClickedEvent);
    on<ImagePickedEvent>(imagePickedEvent);
    on<NavigateToSingleCarDetailsPageEvent>(navigateToSingleCarDetailsPageEvent);
  }

  FutureOr<void> floatingButtonClickedEvent(
    FloatingButtonClickedEvent event, Emitter<SellerHomeScreenState> emit) {
      emit(FloatingButtonClickedActionState());
  }

  FutureOr<void> backArrowClickedEvent(
    BackArrowClickedEvent event, Emitter<SellerHomeScreenState> emit) {
      emit(BackArrowClickedActionState());
  }

  FutureOr<void> postNewCarButtonClickedEvent(
    PostNewCarButtonClickedEvent event, Emitter<SellerHomeScreenState> emit) {
      emit(PostNewCarButtonClickedActionState(
        postCarFormkey: event.postCarFormkey,
        carBrandController: event.carBrandController,
        carModelNameController: event.carModelNameController,
        carColorController: event.carColorController,
        carYearController: event.carYearController,
        carPriceController: event.carPriceController,
        carFuelController: event.carFuelController,
        carKilometerController: event.carKilometerController,
        regNumberController: event.regNumberController,
        numOfOwnerController: event.numOfOwnerController,
        transmissionController: event.transmissionController,
        insuranceController: event.insuranceController,
        seatCapacityController: event.seatCapacityController,
        milageController: event.milageController,
        sunroofController: event.sunroofController,
        bootspaceController: event.bootspaceController,
        infotainmentSystemController: event.infotainmentSystemController,
        alloyWheelController: event.alloyWheelController,
        carHeightController: event.carHeightController,
        carWidthController: event.carWidthController,
        carLengthController: event.carLengthController,
        groundClearanceController: event.groundClearanceController,
        airBagController: event.airBagController,
        airConditionerController: event.airConditionerController,
        powerWindowController: event.powerWindowController,
        bodyTypeController: event.bodyTypeController,
        fuelTankController: event.fuelTankController,
        overViewController: event.overViewController
        ));
  }

  FutureOr<void> imagePickedEvent(
    ImagePickedEvent event, Emitter<SellerHomeScreenState> emit) {
      emit(ImagePickedState());
  }

  FutureOr<void> navigateToSingleCarDetailsPageEvent(
    NavigateToSingleCarDetailsPageEvent event, Emitter<SellerHomeScreenState> emit) {
      emit(NavigateToSingleCarDetailsPageActionState(data: event.data));
  }
}
