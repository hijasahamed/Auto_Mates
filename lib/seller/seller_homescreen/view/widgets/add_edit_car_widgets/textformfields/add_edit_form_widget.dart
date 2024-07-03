import 'package:auto_mates/user/commonwidgets/text_form_field/text_form_widget.dart';
import 'package:flutter/material.dart';

class AddEditFormWidget extends StatelessWidget {
  const AddEditFormWidget({
    super.key,
    required this.postCarFormkey,
    required this.carBrandController,
    required this.carColorController,
    required this.carFuelController,
    required this.carKilometerController,
    required this.carModelNameController,
    required this.carPriceController,
    required this.carYearController,
    required this.screenSize,
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
  final TextEditingController carBrandController ;
  final TextEditingController carModelNameController;
  final TextEditingController carColorController ;
  final TextEditingController carYearController ;
  final TextEditingController carPriceController ;
  final TextEditingController carFuelController;
  final TextEditingController carKilometerController ;
  final GlobalKey<FormState> postCarFormkey ;
  final Size screenSize;
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
  @override
  Widget build(BuildContext context) {
    return Form(
      key: postCarFormkey,
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Brand Name',
                enabledBorderColor: Colors.white,
                  focusedBorderColor: Colors.red,
                  valueTextColor: Colors.black,
                labelTextColor: Colors.grey,
                controller: carBrandController,
                warning: 'Enter the brand of car',
                obscure: false,
                brandName: true,
                keyBoardType: TextInputType.name,
                textCapitalization:
                    TextCapitalization.none,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Model Name',
                enabledBorderColor: Colors.white,
                  focusedBorderColor: Colors.red,
                  valueTextColor: Colors.black,
                labelTextColor: Colors.grey,
                controller: carModelNameController,
                warning: 'Enter the model name of car',
                obscure: false,
                keyBoardType: TextInputType.name,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Color',
                enabledBorderColor: Colors.white,
                  focusedBorderColor: Colors.red,
                  valueTextColor: Colors.black,
                labelTextColor: Colors.grey,
                controller: carColorController,
                warning: 'Enter what color is the car',
                obscure: false,
                keyBoardType: TextInputType.name,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Year',
                enabledBorderColor: Colors.white,
                  focusedBorderColor: Colors.red,
                  valueTextColor: Colors.black,
                labelTextColor: Colors.grey,
                controller: carYearController,
                warning: 'Enter the Registration Year of car',
                obscure: false,
                datePicker: true,
                keyBoardType: TextInputType.none,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: '₹Price',
                enabledBorderColor: Colors.white,
                focusedBorderColor: Colors.red,
                valueTextColor: Colors.black,
                labelTextColor: Colors.grey,
                controller: carPriceController,
                warning: 'Enter the amount of the car to be sold',
                obscure: false,
                keyBoardType: TextInputType.number,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Fuel',
                enabledBorderColor: Colors.white,
                focusedBorderColor: Colors.red,
                valueTextColor: Colors.black,
                labelTextColor: Colors.grey,
                controller: carFuelController,
                warning: 'Enter the fuel type of car',
                obscure: false,
                fuel: true,
                keyBoardType: TextInputType.none,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Kilometers',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carKilometerController,
                warning: 'Enter the exact kilometers the car driven',
                obscure: false,
                keyBoardType: TextInputType.number,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Reg.No',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: regNumberController,
                warning: 'Enter the registration number of car',
                obscure: false,
                keyBoardType: TextInputType.name,
                textCapitalization:
                    TextCapitalization.characters,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'No.of owners',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: numOfOwnerController,
                warning: 'Enter the number of owners owned the car',
                obscure: false,
                keyBoardType: TextInputType.number,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Transmission',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: transmissionController,
                transmission: true,
                warning: 'Enter the car transmission type',
                obscure: false,
                keyBoardType: TextInputType.name,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Insurance',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: insuranceController,
                insurenceDate: true,
                warning: 'Enter the validity of insurence',
                obscure: false,
                keyBoardType: TextInputType.name,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Seating capacity',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: seatCapacityController,
                warning: 'Enter the seat capacity of the car',
                obscure: false,
                keyBoardType: TextInputType.number,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Current Milage',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: milageController,
                warning: 'Enter the current milage',
                obscure: false,
                keyBoardType: TextInputType.number,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Sunroof',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: sunroofController,
                sunroof: true,
                warning: 'Please provide a valid data',
                obscure: false,
                keyBoardType: TextInputType.none,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Bootspace (Liters)',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: bootspaceController,
                warning: 'Please the quantity of bootspace',
                obscure: false,
                keyBoardType: TextInputType.number,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Infotainment system',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: infotainmentSystemController,
                infotainment: true,
                warning: 'Please provide appropriate details',
                obscure: false,
                keyBoardType: TextInputType.none,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Alloy wheels',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: alloyWheelController,
                alloy: true,
                warning: 'Please provide appropriate details',
                obscure: false,
                keyBoardType: TextInputType.none,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Car Height (mm)',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carHeightController,
                warning: 'Provide the height of the car',
                obscure: false,
                keyBoardType: TextInputType.number,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Car Width (mm)',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carWidthController,
                warning: 'Provide the width of the car',
                obscure: false,
                keyBoardType: TextInputType.number,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Car Length (mm)',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carLengthController,
                warning: 'Provide the length of the car',
                obscure: false,
                keyBoardType: TextInputType.number,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Ground Clearence (mm)',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: groundClearanceController,
                warning: 'Provide the ground clearence of the car',
                obscure: false,
                keyBoardType: TextInputType.number,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Air bags',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: airBagController,
                warning: 'Provide the number of airbags',
                obscure: false,
                keyBoardType: TextInputType.number,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Air Conditioner',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: airConditionerController,
                airConditioner: true,
                warning: 'Please provide appropriate details',
                obscure: false,
                keyBoardType: TextInputType.none,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Power window',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: powerWindowController,
                powerWindow: true,
                warning: 'Please provide appropriate details',
                obscure: false,
                keyBoardType: TextInputType.none,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Body type',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: bodyTypeController,
                bodyType: true,
                warning: 'Please provide appropriate details',
                obscure: false,
                keyBoardType: TextInputType.none,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Fuel Tank (Liters)',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: fuelTankController,
                warning: 'Please provide appropriate details',
                obscure: false,
                keyBoardType: TextInputType.number,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
              wrapInContainer: true,
                text: 'Overview',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: overViewController,
                warning: 'Please provide appropriate details',
                obscure: false,
                keyBoardType: TextInputType.name,
                textCapitalization:
                    TextCapitalization.sentences,
                fillColor: const Color(0XFFDBEDF5)),
          ),
        ],
      ),
    );
  }
}