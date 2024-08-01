import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_chat_event.dart';
part 'user_chat_state.dart';

class UserChatBloc extends Bloc<UserChatEvent, UserChatState> {
  UserChatBloc() : super(UserChatInitial()) {
    on<RatingEmojiRefreshEvent>(ratingEmojiRefreshEvent);
    on<UserRatedTheSellerEvent>(userRatedTheSellerEvent);
    on<UserRatedTheSellerLoadingEvent>(userRatedTheSellerLoadingEvent);
  }

  FutureOr<void> ratingEmojiRefreshEvent(
    RatingEmojiRefreshEvent event, Emitter<UserChatState> emit) {
      emit(RatingEmojiRefreshState());
  }

  FutureOr<void> userRatedTheSellerEvent(
    UserRatedTheSellerEvent event, Emitter<UserChatState> emit) {
      emit(UserRatedTheSellerState());
  }

  FutureOr<void> userRatedTheSellerLoadingEvent(
    UserRatedTheSellerLoadingEvent event, Emitter<UserChatState> emit) {
      emit(UserRatedTheSellerLoadingState());
  }
}
