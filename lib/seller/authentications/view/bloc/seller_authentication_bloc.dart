import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'seller_authentication_event.dart';
part 'seller_authentication_state.dart';

class SellerAuthenticationBloc extends Bloc<SellerAuthenticationEvent, SellerAuthenticationState> {
  SellerAuthenticationBloc() : super(SellerAuthenticationInitial()) {
    on<SellerAuthenticationInitialEvent>(sellerAuthenticationInitialEvent);
    on<SellerGetOtpButtonClickedEvent>(loginButtonClickedEvent);
    on<CreateCompanyButtonClickedEvent>(createCompanyButtonClickedEvent);
    on<AlreadyASellerLoginToYourAccountButtonClickedEvent>(alreadyASellerLoginToYourAccountButtonClickedEvent);
    on<SubmitOtpButtonClickedEvent>(submitOtpButtonClickedEvent);
    on<ResendOtpButtonClickedEvent>(resendOtpButtonClickedEvent);
    on<SellerProfileImageRefreshEvent>(sellerProfileImageRefreshEvent);
    on<SubmitOtpClickedLoadingEvent>(submitOtpClickedLoadingEvent);
    on<SubmitOtpClickedStopLoadingEvent>(submitOtpClickedStopLoadingEvent);
    on<SubmitOtpButtonClickedSuccessEvent>(submitOtpButtonClickedSuccessEvent);
    on<GetOtpClickedLoadingEvent>(getOtpClickedLoadingEvent);
    on<GetOtpClickedStopLoadingEvent>(getOtpClickedStopLoadingEvent);
    on<CreateCompanyButtonLoadingEvent>(createCompanyButtonLoadingEvent);
    on<CreateCompanyButtonStopLoadingEvent>(createCompanyButtonStopLoadingEvent);
  }

  FutureOr<void> sellerAuthenticationInitialEvent(
    SellerAuthenticationInitialEvent event, Emitter<SellerAuthenticationState> emit)async {
      emit(SellerAuthenticationLoadingState());     
      await Future.delayed(const Duration(milliseconds: 2300));
      emit(SellerAuthenticationLoadedSuccessState());
  }

  FutureOr<void> loginButtonClickedEvent(
    SellerGetOtpButtonClickedEvent event, Emitter<SellerAuthenticationState> emit) {
      emit(SellerGetOtpButtonClickedActionState());
  }

  FutureOr<void> createCompanyButtonClickedEvent(
    CreateCompanyButtonClickedEvent event, Emitter<SellerAuthenticationState> emit) {
      emit(CreateCompanyButtonClickedActionState());
  }


  FutureOr<void> alreadyASellerLoginToYourAccountButtonClickedEvent(
    AlreadyASellerLoginToYourAccountButtonClickedEvent event, Emitter<SellerAuthenticationState> emit) {
      emit(AlreadyASellerLoginToYourAccountButtonClickedActionState());
  }

  

  FutureOr<void> submitOtpButtonClickedEvent(
    SubmitOtpButtonClickedEvent event, Emitter<SellerAuthenticationState> emit) {
      emit(SubmitOtpButtonClickedActionState(code: event.code));
  }

  FutureOr<void> resendOtpButtonClickedEvent(
    ResendOtpButtonClickedEvent event, Emitter<SellerAuthenticationState> emit) {
      emit(ResendOtpButtonClickedAction());
  }

  FutureOr<void> sellerProfileImageRefreshEvent(
    SellerProfileImageRefreshEvent event, Emitter<SellerAuthenticationState> emit) {
      emit(SellerProfileImageRefreshState());
  }

  FutureOr<void> submitOtpClickedLoadingEvent(
    SubmitOtpClickedLoadingEvent event, Emitter<SellerAuthenticationState> emit) {
      emit(SubmitOtpClickedLoadingState());
  }

  FutureOr<void> submitOtpClickedStopLoadingEvent(
    SubmitOtpClickedStopLoadingEvent event, Emitter<SellerAuthenticationState> emit) {
      emit(SubmitOtpClickedStopLoadingState());
  }

  FutureOr<void> submitOtpButtonClickedSuccessEvent(
    SubmitOtpButtonClickedSuccessEvent event, Emitter<SellerAuthenticationState> emit) {
      emit(SubmitOtpButtonClickedSuccessState());
  }

  FutureOr<void> getOtpClickedLoadingEvent(
    GetOtpClickedLoadingEvent event, Emitter<SellerAuthenticationState> emit) {
      emit(GetOtpClickedLoadingState());
  }

  FutureOr<void> getOtpClickedStopLoadingEvent(
    GetOtpClickedStopLoadingEvent event, Emitter<SellerAuthenticationState> emit) {
      emit(GetOtpClickedStopLoadingState());
  }

  FutureOr<void> createCompanyButtonLoadingEvent(
    CreateCompanyButtonLoadingEvent event, Emitter<SellerAuthenticationState> emit) {
      emit(CreateCompanyButtonLoadingState());
  }

  FutureOr<void> createCompanyButtonStopLoadingEvent(
    CreateCompanyButtonStopLoadingEvent event, Emitter<SellerAuthenticationState> emit) {
      emit(CreateCompanyButtonStopLoadingState());
  }
}
