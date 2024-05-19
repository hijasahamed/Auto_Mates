part of 'profile_screen_bloc.dart';

@immutable
abstract class ProfileScreenEvent {}

class LogoutButtonClickedEvent extends ProfileScreenEvent {}

class ConfirmLogoutEvent extends ProfileScreenEvent {}

class FavouriteConatinerClickedEvent extends ProfileScreenEvent {}
