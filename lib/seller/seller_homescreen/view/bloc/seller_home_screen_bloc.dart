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
        carColorController: event.carColorController,
        carFuelController: event.carFuelController,
        carKilometerController: event.carKilometerController,
        carModelNameController: event.carModelNameController,
        carPriceController: event.carPriceController,
        carYearController: event.carYearController
        ));
  }

  FutureOr<void> imagePickedEvent(
    ImagePickedEvent event, Emitter<SellerHomeScreenState> emit) {
      emit(ImagePickedState());
  }
}
