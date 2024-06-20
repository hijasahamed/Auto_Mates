import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_screen_event.dart';
part 'profile_screen_state.dart';

class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  ProfileScreenBloc() : super(ProfileScreenInitial()) {
    on<LogoutButtonClickedEvent>(logoutButtonClickedEvent);
    on<ConfirmLogoutEvent>(confirmLogoutEvent);
    on<FavouriteConatinerClickedEvent>(favouriteConatinerClickedEvent);
    on<InterestedCarConatinerClickedEvent>(interestedCarConatinerClickedEvent);
    on<InterestedCarOnTapEvent>(interestedCarOnTapEvent);
    on<FavouriteSellerContainerClickedEvent>(favouriteSellerContainerClickedEvent);
    on<FavouriteSellerOnTappedEvent>(favouriteSellerOnTappedEvent);
  }

  FutureOr<void> logoutButtonClickedEvent(
    LogoutButtonClickedEvent event, Emitter<ProfileScreenState> emit) {
      emit(LogoutButtonClickedActionState());
  }

  FutureOr<void> confirmLogoutEvent(
    ConfirmLogoutEvent event, Emitter<ProfileScreenState> emit){
      emit(ConfirmLogoutActionState());      
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
      emit(FavouriteSellerOnTappedState(data: event.data));
  }
}
