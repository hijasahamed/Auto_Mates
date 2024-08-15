part of 'seller_home_screen_bloc.dart';

@immutable
abstract class SellerHomeScreenEvent {}

class SellerHomeScreenInitialEvent extends SellerHomeScreenEvent {}

class FloatingButtonClickedEvent extends SellerHomeScreenEvent {}

class BackArrowClickedEvent extends SellerHomeScreenEvent {}

class ImagePickedEvent extends SellerHomeScreenEvent {}

class NavigateToSingleCarDetailsPageEvent extends SellerHomeScreenEvent {
 final dynamic data;
  NavigateToSingleCarDetailsPageEvent({required this.data});
}

class AllCarsTOSellEvent extends SellerHomeScreenEvent {}

class ReloadPageAfterAddingImagesEvent extends SellerHomeScreenEvent {}

class PostingCarLoadingEvent extends SellerHomeScreenEvent {}
class PostingCarStopLoadingEvent extends SellerHomeScreenEvent {}

class MarkCarSoldLoadingEvent extends SellerHomeScreenEvent {}
class MarkCarSoldStopLoadingEvent extends SellerHomeScreenEvent {}

class FeaturedCarsRemainingTimeEvent extends SellerHomeScreenEvent {}

class EditingCarDataEditButtonCircleIndicatorEvent extends SellerHomeScreenEvent {}