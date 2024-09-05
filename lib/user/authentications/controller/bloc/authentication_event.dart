part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}


class NavigateToSignupPageEvent extends AuthenticationEvent {}

class NavigateToDealerLoginPageEvent extends AuthenticationEvent{}

class LoginButtonClickedEvent extends AuthenticationEvent {}

class AlreadyHaveAccountButtonClickedEvent extends AuthenticationEvent{}

class SignupButtonClickedEvent extends AuthenticationEvent{}

class LoginNotSuccessfullEvent extends AuthenticationEvent{}

class SignupNotSuccessfullEvent extends AuthenticationEvent{}

class SignupSuccessfullAndAccountCreatedEvent extends AuthenticationEvent{}

class LoginWithGoogleButtonSuccessfulNavigateToScreenEvent extends AuthenticationEvent{}

class LoginWithGoogleLoadingEvent extends AuthenticationEvent{}

class ForgetPasswordButtonClickedEvent extends AuthenticationEvent{}

class ResetPasswordButtonClickedEvent extends AuthenticationEvent{}

class UserProfileRefreshEvent extends AuthenticationEvent{}

class UserLoginLoadingStartEvent extends AuthenticationEvent{}

class UserLoginLoadingStopEvent extends AuthenticationEvent{}

class UserLogedinEvent extends AuthenticationEvent{}