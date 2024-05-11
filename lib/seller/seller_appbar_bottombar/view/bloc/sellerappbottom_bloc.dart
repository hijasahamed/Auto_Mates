import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sellerappbottom_event.dart';
part 'sellerappbottom_state.dart';

class SellerappbottomBloc extends Bloc<SellerappbottomEvent, SellerappbottomState> {
  SellerappbottomBloc() : super(SellerappbottomInitial()) {
    on<SellerAppBottomBarInitialEvent>(sellerAppBottomBarInitialEvent);
  }

  FutureOr<void> sellerAppBottomBarInitialEvent(
    SellerAppBottomBarInitialEvent event, Emitter<SellerappbottomState> emit)async {
      emit(SellerAppbottombarLoadingState());    
      await Future.delayed(const Duration(milliseconds: 2500));
      emit(SellerAppbottombarLoadedSuccessState());
  }
}
