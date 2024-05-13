part of 'seller_home_screen_bloc.dart';

@immutable
abstract class SellerHomeScreenEvent {}

class SellerHomeScreenInitialEvent extends SellerHomeScreenEvent {}

class FloatingButtonClickedEvent extends SellerHomeScreenEvent {}
