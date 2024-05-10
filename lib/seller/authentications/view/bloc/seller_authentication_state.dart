part of 'seller_authentication_bloc.dart';

@immutable
sealed class SellerAuthenticationState {}

abstract class SellerAuthenticationActionState extends SellerAuthenticationState {}

class SellerAuthenticationInitial extends SellerAuthenticationState {}



class SellerAuthenticationLoadingState extends SellerAuthenticationState {}

class SellerAuthenticationLoadedSuccessState extends SellerAuthenticationState {}

class SellerLoginButtonClickedActionState extends SellerAuthenticationActionState{}

class CreateCompanyButtonClickedActionState extends SellerAuthenticationActionState{}

class AlreadyASellerLoginToYourAccountButtonClickedActionState extends SellerAuthenticationActionState{}

