import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_chat_event.dart';
part 'user_chat_state.dart';

class UserChatBloc extends Bloc<UserChatEvent, UserChatState> {
  UserChatBloc() : super(UserChatInitial()) {
    on<RatingEmojiRefreshEvent>(ratingEmojiRefreshEvent);
  }

  FutureOr<void> ratingEmojiRefreshEvent(
    RatingEmojiRefreshEvent event, Emitter<UserChatState> emit) {
      emit(RatingEmojiRefreshState());
  }
}
