part of 'profile_screen_bloc.dart';

@immutable
sealed class ProfileScreenState {}

abstract class ProfileScreenActionState extends ProfileScreenState {}

final class ProfileScreenInitial extends ProfileScreenState {}

class LogoutButtonClickedActionState extends ProfileScreenActionState{}

class ConfirmLogoutActionState extends ProfileScreenActionState{}

class FavouriteConatinerClickedActionState extends ProfileScreenActionState{}

class InterestedCarConatinerClickedActionState extends ProfileScreenActionState{}

class InterestedCarOnTapActionState extends ProfileScreenActionState{
  final dynamic data;
  InterestedCarOnTapActionState({required this.data});
}