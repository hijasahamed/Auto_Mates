part of 'seller_authentication_bloc.dart';

@immutable
abstract class SellerAuthenticationEvent {}

class SellerAuthenticationInitialEvent extends SellerAuthenticationEvent {}

class SellerGetOtpButtonClickedEvent extends SellerAuthenticationEvent {}

class CreateCompanyButtonClickedEvent extends SellerAuthenticationEvent {}

class AlreadyASellerLoginToYourAccountButtonClickedEvent extends SellerAuthenticationEvent{}

class SubmitOtpButtonClickedEvent extends SellerAuthenticationEvent{
  final String code;
  SubmitOtpButtonClickedEvent({required this.code});
}

class ResendOtpButtonClickedEvent extends SellerAuthenticationEvent{}

class SellerProfileImageRefreshEvent extends SellerAuthenticationEvent{}

class SubmitOtpClickedLoadingEvent extends SellerAuthenticationEvent{}
class SubmitOtpClickedStopLoadingEvent extends SellerAuthenticationEvent{}
class SubmitOtpButtonClickedSuccessEvent extends SellerAuthenticationEvent{}


class GetOtpClickedLoadingEvent extends SellerAuthenticationEvent{}
class GetOtpClickedStopLoadingEvent extends SellerAuthenticationEvent{}

class CreateCompanyButtonLoadingEvent extends SellerAuthenticationEvent{}
class CreateCompanyButtonStopLoadingEvent extends SellerAuthenticationEvent{}