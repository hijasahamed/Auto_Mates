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
  PostNewCarButtonClickedActionState({
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

class ImagePickedState extends SellerHomeScreenState {}

class NavigateToSingleCarDetailsPageActionState extends SellerHomeScreenState {
  final dynamic data;
  NavigateToSingleCarDetailsPageActionState({required this.data});
}