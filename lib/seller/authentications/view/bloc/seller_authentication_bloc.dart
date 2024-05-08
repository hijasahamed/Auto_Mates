import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'seller_authentication_event.dart';
part 'seller_authentication_state.dart';

class SellerAuthenticationBloc extends Bloc<SellerAuthenticationEvent, SellerAuthenticationState> {
  SellerAuthenticationBloc() : super(SellerAuthenticationInitial()) {
    on<SellerAuthenticationInitialEvent>(sellerAuthenticationInitialEvent);
    on<CreateCompanyButtonClickedEvent>(createCompanyButtonClickedEvent);
  }

  FutureOr<void> sellerAuthenticationInitialEvent(
    SellerAuthenticationInitialEvent event, Emitter<SellerAuthenticationState> emit)async {
      emit(SellerAuthenticationLoadingState());     
      await Future.delayed(const Duration(milliseconds: 1500));
      emit(SellerAuthenticationLoadedSuccessState());
  }

  FutureOr<void> createCompanyButtonClickedEvent(
    CreateCompanyButtonClickedEvent event, Emitter<SellerAuthenticationState> emit) {
      emit(CreateCompanyButtonClickedActionState());
  }

}
