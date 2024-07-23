part of 'user_chat_bloc.dart';

@immutable
sealed class UserChatEvent {}

class RatingEmojiRefreshEvent extends UserChatEvent {}
