part of 'seller_profile_bloc.dart';

@immutable
abstract class SellerProfileEvent {}

class SellerLogoutButtonClickedEvent extends SellerProfileEvent {}

class SellerLogoutConfirmButtonClickedEvent extends SellerProfileEvent {}
