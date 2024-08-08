part of 'homescreen_bloc.dart';

@immutable
abstract class HomescreenState {}

abstract class HomeScreenActionState extends HomescreenState {}

class HomescreenInitial extends HomescreenState {}

class TopSellersAllListNavigateState extends HomescreenState {}

class FeaturedCarsAllListNavigationState extends HomescreenState {}

class RefreshFavouriteCarosalState extends HomescreenState {}