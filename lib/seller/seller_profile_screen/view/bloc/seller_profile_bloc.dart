import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'seller_profile_event.dart';
part 'seller_profile_state.dart';

class SellerProfileBloc extends Bloc<SellerProfileEvent, SellerProfileState> {
  SellerProfileBloc() : super(SellerProfileInitial()) {
    on<SellerLogoutButtonClickedEvent>(sellerLogoutButtonClickedEvent);
  }

  FutureOr<void> sellerLogoutButtonClickedEvent(
    SellerLogoutButtonClickedEvent event, Emitter<SellerProfileState> emit) {
      emit(SellerLogoutButtonClickedActionState());
  }
}
