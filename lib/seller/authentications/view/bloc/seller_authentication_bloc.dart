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
}
