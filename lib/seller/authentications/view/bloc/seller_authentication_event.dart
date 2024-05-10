part of 'seller_authentication_bloc.dart';

@immutable
abstract class SellerAuthenticationEvent {}

class SellerAuthenticationInitialEvent extends SellerAuthenticationEvent {}

class SellerLoginButtonClickedEvent extends SellerAuthenticationEvent {}

class CreateCompanyButtonClickedEvent extends SellerAuthenticationEvent {}

class AlreadyASellerLoginToYourAccountButtonClickedEvent extends SellerAuthenticationEvent{}
