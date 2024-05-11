part of 'seller_authentication_bloc.dart';

@immutable
sealed class SellerAuthenticationState {}

abstract class SellerAuthenticationActionState extends SellerAuthenticationState {}

class SellerAuthenticationInitial extends SellerAuthenticationState {}



class SellerAuthenticationLoadingState extends SellerAuthenticationState {}

class SellerAuthenticationLoadedSuccessState extends SellerAuthenticationState {}

class SellerGetOtpButtonClickedActionState extends SellerAuthenticationActionState{}

class CreateCompanyButtonClickedActionState extends SellerAuthenticationActionState{}

class AlreadyASellerLoginToYourAccountButtonClickedActionState extends SellerAuthenticationActionState{}

class SubmitOtpButtonClickedActionState extends SellerAuthenticationActionState{
  final String code;
  SubmitOtpButtonClickedActionState({required this.code});
}

class ResendOtpButtonClickedAction extends SellerAuthenticationActionState{}
