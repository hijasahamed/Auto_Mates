import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'seller_home_screen_event.dart';
part 'seller_home_screen_state.dart';

class SellerHomeScreenBloc extends Bloc<SellerHomeScreenEvent, SellerHomeScreenState> {
  SellerHomeScreenBloc() : super(SellerHomeScreenInitial()) {
    on<FloatingButtonClickedEvent>(floatingButtonClickedEvent);
    on<BackArrowClickedEvent>(backArrowClickedEvent);
    on<ImagePickedEvent>(imagePickedEvent);
    on<NavigateToSingleCarDetailsPageEvent>(navigateToSingleCarDetailsPageEvent);
    on<AllCarsTOSellEvent>(allCarsTOSellEvent);
    on<ReloadPageAfterAddingImagesEvent>(reloadPageAfterAddingImagesEvent);
    on<PostingCarLoadingEvent>(postingCarLoadingEvent);
    on<PostingCarStopLoadingEvent>(postingCarStopLoadingEvent);
    on<MarkCarSoldLoadingEvent>(markCarSoldLoadingEvent);
    on<MarkCarSoldStopLoadingEvent>(markCarSoldStopLoadingEvent);
    on<FeaturedCarsRemainingTimeEvent>(featuredCarsRemainingTimeEvent);
    on<EditingCarDataEditButtonCircleIndicatorEvent>(editingCarDataEditButtonCircleIndicatorEvent);
  }

  FutureOr<void> floatingButtonClickedEvent(
    FloatingButtonClickedEvent event, Emitter<SellerHomeScreenState> emit) {
      emit(FloatingButtonClickedActionState());
  }

  FutureOr<void> backArrowClickedEvent(
    BackArrowClickedEvent event, Emitter<SellerHomeScreenState> emit) {
      emit(BackArrowClickedActionState());
  }

  FutureOr<void> imagePickedEvent(
    ImagePickedEvent event, Emitter<SellerHomeScreenState> emit) {
      emit(ImagePickedState());
  }

  FutureOr<void> navigateToSingleCarDetailsPageEvent(
    NavigateToSingleCarDetailsPageEvent event, Emitter<SellerHomeScreenState> emit) {
      emit(NavigateToSingleCarDetailsPageActionState(data: event.data));
  }

  FutureOr<void> allCarsTOSellEvent(AllCarsTOSellEvent event, Emitter<SellerHomeScreenState> emit) {
    emit(AllCarsTOSellState());
  }

  FutureOr<void> reloadPageAfterAddingImagesEvent(
    ReloadPageAfterAddingImagesEvent event, Emitter<SellerHomeScreenState> emit) {
      emit(ReloadPageAfterAddingImagesState());
  }

  FutureOr<void> postingCarLoadingEvent(
    PostingCarLoadingEvent event, Emitter<SellerHomeScreenState> emit) {
      emit(PostingCarLoadingState());
  }

  FutureOr<void> postingCarStopLoadingEvent(
    PostingCarStopLoadingEvent event, Emitter<SellerHomeScreenState> emit) {
      emit(PostingCarStopLoadingState());
  }

  FutureOr<void> markCarSoldLoadingEvent(
    MarkCarSoldLoadingEvent event, Emitter<SellerHomeScreenState> emit) {
      emit(MarkCarSoldLoadingState());
  }

  FutureOr<void> markCarSoldStopLoadingEvent(
    MarkCarSoldStopLoadingEvent event, Emitter<SellerHomeScreenState> emit) {
      emit(MarkCarSoldStopLoadingState());
  }

  FutureOr<void> featuredCarsRemainingTimeEvent(
    FeaturedCarsRemainingTimeEvent event, Emitter<SellerHomeScreenState> emit) {
      emit(FeaturedCarsRemainingTimeState());
  }

  FutureOr<void> editingCarDataEditButtonCircleIndicatorEvent(
    EditingCarDataEditButtonCircleIndicatorEvent event, Emitter<SellerHomeScreenState> emit) {
      emit(EditingCarDataEditButtonCircleIndicatorState());
  }
}
