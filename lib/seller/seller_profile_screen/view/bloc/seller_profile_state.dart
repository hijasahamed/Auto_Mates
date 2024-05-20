part of 'seller_profile_bloc.dart';

@immutable
sealed class SellerProfileState {}

abstract class SellerProfileActionState  extends SellerProfileState {}

final class SellerProfileInitial extends SellerProfileState {}

final class SellerLogoutButtonClickedActionState extends SellerProfileActionState {}
