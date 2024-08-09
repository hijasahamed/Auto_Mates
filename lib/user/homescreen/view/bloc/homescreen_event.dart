part of 'homescreen_bloc.dart';

@immutable
abstract class HomescreenEvent {}

class  HomeScreenInitialEvent extends HomescreenEvent {}

class TopSellersAllListNavigateEvent extends HomescreenEvent {}

class FeaturedCarsAllListNavigationEvent extends HomescreenEvent {}

class RefreshFavouriteCarosalEvent extends HomescreenEvent {}

class NavigateLatestNewsBannerToReadScreenEvent  extends HomescreenEvent {
  final dynamic article;
  NavigateLatestNewsBannerToReadScreenEvent({required this.article});
}