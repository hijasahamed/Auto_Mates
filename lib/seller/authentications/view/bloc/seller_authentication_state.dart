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

class SellerProfileImageRefreshState extends SellerAuthenticationActionState{}

class SubmitOtpClickedLoadingState extends SellerAuthenticationState {}
class SubmitOtpClickedStopLoadingState extends SellerAuthenticationState {}
class SubmitOtpButtonClickedSuccessState extends SellerAuthenticationState {}


class GetOtpClickedLoadingState extends SellerAuthenticationState {}
class GetOtpClickedStopLoadingState extends SellerAuthenticationState {}

class CreateCompanyButtonLoadingState extends SellerAuthenticationState {}
class CreateCompanyButtonStopLoadingState extends SellerAuthenticationState {}