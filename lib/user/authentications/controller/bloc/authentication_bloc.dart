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
    on<LoginNotSuccessfullEvent>(loginNotSuccessfullEvent);
    on<SignupNotSuccessfullEvent>(signupNotSuccessfullEvent);
    on<SignupSuccessfullAndAccountCreatedEvent>(signupSuccessfullAndAccountCreatedEvent);
    on<LoginWithGoogleButtonSuccessfulNavigateToScreenEvent>(loginWithGoogleButtonSuccessfulNavigateToScreenEvent);
    on<ForgetPasswordButtonClickedEvent>(forgetPasswordButtonClickedEvent);
    on<ResetPasswordButtonClickedEvent>(resetPasswordButtonClickedEvent);
    on<UserProfileRefreshEvent>(userProfileRefreshEvent);
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

  FutureOr<void> loginNotSuccessfullEvent(
    LoginNotSuccessfullEvent event, Emitter<AuthenticationState> emit) {
      emit(LoginNotSuccessfullActionState());
  }

  FutureOr<void> signupNotSuccessfullEvent(
    SignupNotSuccessfullEvent event, Emitter<AuthenticationState> emit) {
      emit(SignupNotSuccessfullActionState());
  }

  FutureOr<void> signupSuccessfullAndAccountCreatedEvent(
    SignupSuccessfullAndAccountCreatedEvent event, Emitter<AuthenticationState> emit) {
      emit(SignupSuccessfullAndAccountCreatedActionState());
  }

  FutureOr<void> loginWithGoogleButtonSuccessfulNavigateToScreenEvent(
    LoginWithGoogleButtonSuccessfulNavigateToScreenEvent event, Emitter<AuthenticationState> emit) {
      emit(LoginWithGoogleButtonSuccessfulNavigateToScreenActionState());
  }

  FutureOr<void> forgetPasswordButtonClickedEvent(
    ForgetPasswordButtonClickedEvent event, Emitter<AuthenticationState> emit) {
      emit(ForgetPasswordButtonClickedActionState());
  }

  FutureOr<void> resetPasswordButtonClickedEvent(
    ResetPasswordButtonClickedEvent event, Emitter<AuthenticationState> emit) {
      emit(ResetPasswordButtonClickedActionState());
  } 

  FutureOr<void> userProfileRefreshEvent(
    UserProfileRefreshEvent event, Emitter<AuthenticationState> emit) {
      emit(UserProfileRefreshState());
  }
}

