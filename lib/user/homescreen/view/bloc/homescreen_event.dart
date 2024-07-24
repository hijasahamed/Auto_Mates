part of 'homescreen_bloc.dart';

@immutable
abstract class HomescreenEvent {}

class  HomeScreenInitialEvent extends HomescreenEvent {}

class TopSellersAllListNavigateEvent extends HomescreenEvent {}