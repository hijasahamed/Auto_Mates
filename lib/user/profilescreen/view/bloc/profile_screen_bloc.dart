import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_screen_event.dart';
part 'profile_screen_state.dart';

class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  ProfileScreenBloc() : super(ProfileScreenInitial()) {
    on<LogoutButtonClickedEvent>(logoutButtonClickedEvent);
    on<ConfirmLogoutEvent>(confirmLogoutEvent);
  }

  FutureOr<void> logoutButtonClickedEvent(
    LogoutButtonClickedEvent event, Emitter<ProfileScreenState> emit) {
      emit(LogoutButtonClickedActionState());
  }

  FutureOr<void> confirmLogoutEvent(
    ConfirmLogoutEvent event, Emitter<ProfileScreenState> emit){
      emit(ConfirmLogoutActionState());      
  }

}
