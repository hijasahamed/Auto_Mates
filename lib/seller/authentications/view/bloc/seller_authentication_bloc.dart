import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'seller_authentication_event.dart';
part 'seller_authentication_state.dart';

class SellerAuthenticationBloc extends Bloc<SellerAuthenticationEvent, SellerAuthenticationState> {
  SellerAuthenticationBloc() : super(SellerAuthenticationInitial()) {
    on<SellerAuthenticationInitialEvent>(sellerAuthenticationInitialEvent);
    on<SellerLoginButtonClickedEvent>(loginButtonClickedEvent);
    on<CreateCompanyButtonClickedEvent>(createCompanyButtonClickedEvent);
    on<AlreadyASellerLoginToYourAccountButtonClickedEvent>(alreadyASellerLoginToYourAccountButtonClickedEvent);
  }

  FutureOr<void> sellerAuthenticationInitialEvent(
    SellerAuthenticationInitialEvent event, Emitter<SellerAuthenticationState> emit)async {
      emit(SellerAuthenticationLoadingState());     
      await Future.delayed(const Duration(milliseconds: 2300));
      emit(SellerAuthenticationLoadedSuccessState());
  }

  FutureOr<void> loginButtonClickedEvent(
    SellerLoginButtonClickedEvent event, Emitter<SellerAuthenticationState> emit) {
      emit(SellerLoginButtonClickedActionState());
  }

  FutureOr<void> createCompanyButtonClickedEvent(
    CreateCompanyButtonClickedEvent event, Emitter<SellerAuthenticationState> emit) {
      emit(CreateCompanyButtonClickedActionState());
  }


  FutureOr<void> alreadyASellerLoginToYourAccountButtonClickedEvent(
    AlreadyASellerLoginToYourAccountButtonClickedEvent event, Emitter<SellerAuthenticationState> emit) {
      emit(AlreadyASellerLoginToYourAccountButtonClickedActionState());
  }

  
}
