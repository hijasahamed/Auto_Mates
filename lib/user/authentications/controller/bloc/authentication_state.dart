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

class LoginNotSuccessfullActionState extends AuthenticationActionState{}

class SignupNotSuccessfullActionState extends AuthenticationActionState{}

class SignupSuccessfullAndAccountCreatedActionState extends AuthenticationActionState{}

class LoginWithGoogleButtonSuccessfulNavigateToScreenActionState extends AuthenticationActionState{}

class ForgetPasswordButtonClickedActionState extends  AuthenticationActionState{}

class ResetPasswordButtonClickedActionState extends AuthenticationActionState{}

