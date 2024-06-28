part of 'profile_screen_bloc.dart';

@immutable
abstract class ProfileScreenEvent {}

class FavouriteConatinerClickedEvent extends ProfileScreenEvent {}

class InterestedCarConatinerClickedEvent extends ProfileScreenEvent {}

class InterestedCarOnTapEvent extends ProfileScreenEvent {
  final dynamic data;
  InterestedCarOnTapEvent({required this.data});
}

class FavouriteSellerContainerClickedEvent extends ProfileScreenEvent {}

class FavouriteSellerOnTappedEvent extends ProfileScreenEvent {}

class EmiCalculatorConatinerClickedEvent extends ProfileScreenEvent {}

class CompareCarsContainerClickedEvent extends ProfileScreenEvent {}