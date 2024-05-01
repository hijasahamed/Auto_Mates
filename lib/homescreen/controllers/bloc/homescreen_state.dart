part of 'homescreen_bloc.dart';

@immutable
abstract class HomescreenState {}

abstract class HomeScreenActionState extends HomescreenState {}

final class HomescreenInitial extends HomescreenState {}

class HomeScreenLoadingState extends HomescreenState {}

class HomeScreenLoadedSuccessState extends HomescreenState {}

class HomeScreenErrorState extends HomescreenState {}

class HomeScreenNavigateToTopSellersSingleData extends HomeScreenActionState{}

class HomeScreenNavigateToTopSellersViewAllEvent extends HomeScreenActionState{}