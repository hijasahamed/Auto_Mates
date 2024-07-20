import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'seller_chat_event.dart';
part 'seller_chat_state.dart';

class SellerChatBloc extends Bloc<SellerChatEvent, SellerChatState> {
  SellerChatBloc() : super(SellerChatInitial()) {
    on<SellerChatScreenRebuildEvent>(sellerChatScreenRebuildEvent);
  }

  FutureOr<void> sellerChatScreenRebuildEvent(SellerChatScreenRebuildEvent event, Emitter<SellerChatState> emit) {}
}
