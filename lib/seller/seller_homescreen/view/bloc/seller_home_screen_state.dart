part of 'seller_home_screen_bloc.dart';

@immutable
sealed class SellerHomeScreenState {}

abstract class SellerHomeScreenActionState extends SellerHomeScreenState {}

final class SellerHomeScreenInitial extends SellerHomeScreenState {}

class FloatingButtonClickedActionState extends SellerHomeScreenActionState{}

class BackArrowClickedActionState extends SellerHomeScreenActionState{}

class PostNewCarButtonClickedActionState extends SellerHomeScreenActionState{
  final GlobalKey postCarFormkey;
  final TextEditingController carBrandController;
  final TextEditingController carModelNameController;
  final TextEditingController carColorController;
  final TextEditingController carYearController;
  final TextEditingController carPriceController;
  final TextEditingController carFuelController;
  final TextEditingController carKilometerController;
  final TextEditingController regNumberController;
  final TextEditingController numOfOwnerController;
  final TextEditingController transmissionController;
  final TextEditingController insuranceController;
  final TextEditingController seatCapacityController;
  final TextEditingController milageController;
  final TextEditingController sunroofController;
  final TextEditingController bootspaceController;
  final TextEditingController infotainmentSystemController;
  final TextEditingController alloyWheelController;
  final TextEditingController carHeightController;
  final TextEditingController carWidthController;
  final TextEditingController carLengthController;
  final TextEditingController groundClearanceController;
  final TextEditingController airBagController;
  final TextEditingController airConditionerController;
  final TextEditingController powerWindowController;
  final TextEditingController bodyTypeController;
  final TextEditingController fuelTankController;
  final TextEditingController overViewController;
  PostNewCarButtonClickedActionState({
    required this.postCarFormkey,
    required this.carBrandController,
    required this.carModelNameController,
    required this.carColorController,
    required this.carYearController,
    required this.carPriceController,
    required this.carFuelController,
    required this.carKilometerController,
    required this.regNumberController,
    required this.numOfOwnerController,
    required this.transmissionController,
    required this.insuranceController,
    required this.seatCapacityController,
    required this.milageController,
    required this.sunroofController,
    required this.bootspaceController,
    required this.infotainmentSystemController,
    required this.alloyWheelController,
    required this.carHeightController,
    required this.carWidthController,
    required this.carLengthController,
    required this.groundClearanceController,
    required this.airBagController,
    required this.airConditionerController,
    required this.powerWindowController,
    required this.bodyTypeController,
    required this.fuelTankController,
    required this.overViewController
  });
}

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