part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

abstract class AuthenticationActionState extends AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class NavigateToSignupPageActionState extends AuthenticationActionState{}

class NavigateToDealerLoginPageActionState extends AuthenticationActionState{}

class LoginButtonClickedActionState extends AuthenticationActionState{}

class AlreadyHaveAccountButtonClickedActionState extends AuthenticationActionState{}

class SignupButtonClickedActionState extends AuthenticationActionState{}
