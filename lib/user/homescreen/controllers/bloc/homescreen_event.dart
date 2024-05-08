part of 'homescreen_bloc.dart';

@immutable
abstract class HomescreenEvent {}
class  HomeScreenInitialEvent extends HomescreenEvent {}



class TopSellersSingleDataEvent extends HomescreenEvent {}

class TopSellersViewAllEvent extends HomescreenEvent {}

class FeaturedCarsSingleDataEvent extends HomescreenEvent {}

class FeaturedCarsViewAllEvent extends HomescreenEvent {}

class FavouriteCarsCarousalClickedEvent extends HomescreenEvent {}

class LatestCarUpdatesSingleDataEvent extends HomescreenState{}

class LatestCarUpdatesViewAllEvent extends HomescreenEvent {}

class EmiCalculateGetOffersCardClickedEvent extends HomescreenEvent {}
