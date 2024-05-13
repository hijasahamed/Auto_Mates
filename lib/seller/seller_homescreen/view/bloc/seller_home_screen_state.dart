part of 'seller_home_screen_bloc.dart';

@immutable
sealed class SellerHomeScreenState {}

abstract class SellerHomeScreenActionState extends SellerHomeScreenState {}

final class SellerHomeScreenInitial extends SellerHomeScreenState {}

class FloatingButtonClickedActionState extends SellerHomeScreenActionState{}
