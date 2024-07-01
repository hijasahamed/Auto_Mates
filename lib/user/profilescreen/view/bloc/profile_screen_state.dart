part of 'profile_screen_bloc.dart';

@immutable
sealed class ProfileScreenState {}

abstract class ProfileScreenActionState extends ProfileScreenState {}

final class ProfileScreenInitial extends ProfileScreenState {}


class FavouriteConatinerClickedActionState extends ProfileScreenActionState{}

class InterestedCarConatinerClickedActionState extends ProfileScreenActionState{}

class InterestedCarOnTapActionState extends ProfileScreenActionState{
  final dynamic data;
  InterestedCarOnTapActionState({required this.data});
}

class FavouriteSellerContainerClickedState extends ProfileScreenActionState{}

class FavouriteSellerOnTappedState extends ProfileScreenActionState{}

class EmiCalculatorConatinerClickedState extends ProfileScreenActionState{}

class CompareCarsContainerClickedState extends ProfileScreenActionState{}

class NavigateToSelectCarForComaparingPageState extends ProfileScreenActionState{
  final bool boolVal;
 NavigateToSelectCarForComaparingPageState({required this.boolVal});
}

class CompareCarScreenRefreshState extends ProfileScreenActionState{}

class NavigateToComparedScreenState extends ProfileScreenActionState{}

class PreviousCompareCarScreenRefreshState extends ProfileScreenActionState{}

class EditImageRefreshState extends ProfileScreenActionState{}

class UpdateUserLoadingState extends ProfileScreenActionState{}