import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_screen_event.dart';
part 'profile_screen_state.dart';

class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  ProfileScreenBloc() : super(ProfileScreenInitial()) {
    on<FavouriteConatinerClickedEvent>(favouriteConatinerClickedEvent);
    on<InterestedCarConatinerClickedEvent>(interestedCarConatinerClickedEvent);
    on<InterestedCarOnTapEvent>(interestedCarOnTapEvent);
    on<FavouriteSellerContainerClickedEvent>(favouriteSellerContainerClickedEvent);
    on<FavouriteSellerOnTappedEvent>(favouriteSellerOnTappedEvent);
    on<EmiCalculatorConatinerClickedEvent>(emiCalculatorConatinerClickedEvent);
    on<CompareCarsContainerClickedEvent>(compareCarsContainerClickedEvent);
    on<NavigateToSelectCarForComaparingPageEvent>(navigateToSelectCarForComaparingPageEvent);
    on<CompareCarScreenRefreshEvent>(compareCarScreenRefreshEvent);
    on<NavigateToComparedScreenEvent>(navigateToComparedScreenEvent);
    on<PreviousCompareCarScreenRefreshEvent>(previousCompareCarScreenRefreshEvent);
    on<EditImageRefreshEvent>(editImageRefreshEvent);
    on<UpdateUserLoadingEvent>(updateUserLoadingEvent);
  }

  FutureOr<void> favouriteConatinerClickedEvent(
    FavouriteConatinerClickedEvent event, Emitter<ProfileScreenState> emit) {
      emit(FavouriteConatinerClickedActionState());
  }

  FutureOr<void> interestedCarConatinerClickedEvent(
    InterestedCarConatinerClickedEvent event, Emitter<ProfileScreenState> emit) {
      emit(InterestedCarConatinerClickedActionState());
  }

  FutureOr<void> interestedCarOnTapEvent(
    InterestedCarOnTapEvent event, Emitter<ProfileScreenState> emit) {
      emit(InterestedCarOnTapActionState(data: event.data));
  }

  FutureOr<void> favouriteSellerContainerClickedEvent(
    FavouriteSellerContainerClickedEvent event, Emitter<ProfileScreenState> emit) {
      emit(FavouriteSellerContainerClickedState());
  }

  FutureOr<void> favouriteSellerOnTappedEvent(
    FavouriteSellerOnTappedEvent event, Emitter<ProfileScreenState> emit) {
      emit(FavouriteSellerOnTappedState());     
  }

  FutureOr<void> emiCalculatorConatinerClickedEvent(
    EmiCalculatorConatinerClickedEvent event, Emitter<ProfileScreenState> emit) {
      emit(EmiCalculatorConatinerClickedState());
  }

  FutureOr<void> compareCarsContainerClickedEvent(
    CompareCarsContainerClickedEvent event, Emitter<ProfileScreenState> emit) {
      emit(CompareCarsContainerClickedState());
  }

  FutureOr<void> navigateToSelectCarForComaparingPageEvent(
    NavigateToSelectCarForComaparingPageEvent event, Emitter<ProfileScreenState> emit) {
      emit(NavigateToSelectCarForComaparingPageState(boolVal: event.boolVal));
  }

  FutureOr<void> compareCarScreenRefreshEvent(
    CompareCarScreenRefreshEvent event, Emitter<ProfileScreenState> emit) {
      emit(CompareCarScreenRefreshState());
  }

  FutureOr<void> navigateToComparedScreenEvent(
    NavigateToComparedScreenEvent event, Emitter<ProfileScreenState> emit) {
      emit(NavigateToComparedScreenState());
  }

  FutureOr<void> previousCompareCarScreenRefreshEvent(
    PreviousCompareCarScreenRefreshEvent event, Emitter<ProfileScreenState> emit) {
      emit(PreviousCompareCarScreenRefreshState());
  }

  FutureOr<void> editImageRefreshEvent(
    EditImageRefreshEvent event, Emitter<ProfileScreenState> emit) {
      emit(EditImageRefreshState());
  }

  FutureOr<void> updateUserLoadingEvent(
    UpdateUserLoadingEvent event, Emitter<ProfileScreenState> emit) {
      emit(UpdateUserLoadingState());
  }
}
