part of 'seller_chat_bloc.dart';

@immutable
sealed class SellerChatState {}

final class SellerChatInitial extends SellerChatState {}

final class SellerChatScreenRebuildState extends SellerChatState{}