part of 'sellerappbottom_bloc.dart';

@immutable
sealed class SellerappbottomState {}

abstract class SellerappbottomActionstate extends SellerappbottomState {}

final class SellerappbottomInitial extends SellerappbottomState {}

class SellerAppbottombarLoadingState extends SellerappbottomState {}

class SellerAppbottombarLoadedSuccessState extends SellerappbottomState {}