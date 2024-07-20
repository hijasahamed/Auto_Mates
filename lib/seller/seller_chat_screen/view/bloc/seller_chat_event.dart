part of 'seller_chat_bloc.dart';

@immutable
sealed class SellerChatEvent {}

final class SellerChatScreenRebuildEvent extends SellerChatEvent{}
