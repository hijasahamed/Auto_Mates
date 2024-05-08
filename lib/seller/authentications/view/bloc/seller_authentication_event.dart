part of 'seller_authentication_bloc.dart';

@immutable
abstract class SellerAuthenticationEvent {}

class SellerAuthenticationInitialEvent extends SellerAuthenticationEvent {}

class CreateCompanyButtonClickedEvent extends SellerAuthenticationEvent {}
