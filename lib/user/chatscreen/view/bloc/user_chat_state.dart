part of 'user_chat_bloc.dart';

@immutable
sealed class UserChatState {}

final class UserChatInitial extends UserChatState {}

class RatingEmojiRefreshState extends UserChatState {}
