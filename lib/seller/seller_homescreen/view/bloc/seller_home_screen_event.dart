part of 'seller_home_screen_bloc.dart';

@immutable
abstract class SellerHomeScreenEvent {}

class SellerHomeScreenInitialEvent extends SellerHomeScreenEvent {}

class FloatingButtonClickedEvent extends SellerHomeScreenEvent {}

class BackArrowClickedEvent extends SellerHomeScreenEvent {}

class PostNewCarButtonClickedEvent extends SellerHomeScreenEvent {
  final GlobalKey postCarFormkey;
  final TextEditingController carBrandController;
  final TextEditingController carModelNameController;
  final TextEditingController carColorController;
  final TextEditingController carYearController;
  final TextEditingController carPriceController;
  final TextEditingController carFuelController;
  final TextEditingController carKilometerController;
  PostNewCarButtonClickedEvent({
    required this.postCarFormkey,
    required this.carBrandController,
    required this.carModelNameController,
    required this.carColorController,
    required this.carYearController,
    required this.carPriceController,
    required this.carFuelController,
    required this.carKilometerController,
  });
}
