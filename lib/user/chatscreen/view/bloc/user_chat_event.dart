part of 'user_chat_bloc.dart';

@immutable
sealed class UserChatEvent {}

class RatingEmojiRefreshEvent extends UserChatEvent {}

class UserRatedTheSellerLoadingEvent extends UserChatEvent {}

class UserRatedTheSellerEvent extends UserChatEvent {}
