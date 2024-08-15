part of 'seller_home_screen_bloc.dart';

@immutable
sealed class SellerHomeScreenState {}

abstract class SellerHomeScreenActionState extends SellerHomeScreenState {}

final class SellerHomeScreenInitial extends SellerHomeScreenState {}

class FloatingButtonClickedActionState extends SellerHomeScreenActionState{}

class BackArrowClickedActionState extends SellerHomeScreenActionState{}

class ImagePickedState extends SellerHomeScreenState {}

class NavigateToSingleCarDetailsPageActionState extends SellerHomeScreenState {
  final dynamic data;
  NavigateToSingleCarDetailsPageActionState({required this.data});
}


class AllCarsTOSellState extends SellerHomeScreenState {}

class ReloadPageAfterAddingImagesState extends SellerHomeScreenState {}

class PostingCarLoadingState extends SellerHomeScreenState {}
class PostingCarStopLoadingState extends SellerHomeScreenState {}

class MarkCarSoldLoadingState extends SellerHomeScreenState {}
class MarkCarSoldStopLoadingState extends SellerHomeScreenState {}

class FeaturedCarsRemainingTimeState extends SellerHomeScreenState {}

class EditingCarDataEditButtonCircleIndicatorState extends SellerHomeScreenState {}