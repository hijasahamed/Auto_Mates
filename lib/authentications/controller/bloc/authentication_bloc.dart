import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  AuthenticationBloc() : super(AuthenticationInitial()) {

    on<NavigateToSignupPageEvent>(navigateToSignupPageEvent);
    on<LoginButtonClickedEvent>(loginButtonClickedEvent);
    on<AlreadyHaveAccountButtonClickedEvent>(alreadyHaveAccountButtonClickedEvent);
    on<SignupButtonClickedEvent>(signupButtonClickedEvent);
    on<NavigateToDealerLoginPageEvent>(navigateToDealerLoginPageEvent);
  }

  FutureOr<void> navigateToSignupPageEvent(
    NavigateToSignupPageEvent event, Emitter<AuthenticationState> emit) {
      emit(NavigateToSignupPageActionState());
  }

  FutureOr<void> loginButtonClickedEvent(
    LoginButtonClickedEvent event, Emitter<AuthenticationState> emit) {
      emit(LoginButtonClickedActionState());
  }

  FutureOr<void> alreadyHaveAccountButtonClickedEvent(
    AlreadyHaveAccountButtonClickedEvent event, Emitter<AuthenticationState> emit) {
      emit(AlreadyHaveAccountButtonClickedActionState());
  }

  FutureOr<void> signupButtonClickedEvent(
    SignupButtonClickedEvent event, Emitter<AuthenticationState> emit) {
      emit(SignupButtonClickedActionState());
  }

  FutureOr<void> navigateToDealerLoginPageEvent(
    NavigateToDealerLoginPageEvent event, Emitter<AuthenticationState> emit) {
      emit(NavigateToDealerLoginPageActionState());
  }
}

