part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}


class NavigateToSignupPageEvent extends AuthenticationEvent {}

class NavigateToDealerLoginPageEvent extends AuthenticationEvent{}

class LoginButtonClickedEvent extends AuthenticationEvent {}

class AlreadyHaveAccountButtonClickedEvent extends AuthenticationEvent{}

class SignupButtonClickedEvent extends AuthenticationEvent{}


