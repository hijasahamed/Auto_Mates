part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}
class AuthenticationInitialEvent extends AuthenticationEvent {}


class DontHaveAccountEvent extends AuthenticationEvent {}

class LoginButtonEvent extends AuthenticationEvent {}

