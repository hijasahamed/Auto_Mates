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
    required this.screenSize
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
                  valueTextColor: Colors.grey,
                labelTextColor: Colors.grey,
                controller: carBrandController,
                warning: 'Enter the brand of car',
                obscure: false,
                brandName: true,
                keyBoardType: TextInputType.name,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormWidget(
              screenSize: screenSize,
                text: 'Model Name',
                enabledBorderColor: Colors.white,
                  focusedBorderColor: Colors.red,
                  valueTextColor: Colors.grey,
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
                  valueTextColor: Colors.grey,
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
                  valueTextColor: Colors.grey,
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
                text: 'Price',
                enabledBorderColor: Colors.white,
                focusedBorderColor: Colors.red,
                valueTextColor: Colors.grey,
                labelTextColor: Colors.grey,
                controller: carPriceController,
                warning: 'Enter the amount of the car to be sold',
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
                text: 'Fuel',
                enabledBorderColor: Colors.white,
                focusedBorderColor: Colors.red,
                valueTextColor: Colors.grey,
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
                valueTextColor: Colors.grey,
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
                valueTextColor: Colors.grey,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carKilometerController,
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
                valueTextColor: Colors.grey,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carKilometerController,
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
                valueTextColor: Colors.grey,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carKilometerController,
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
                valueTextColor: Colors.grey,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carKilometerController,
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
                valueTextColor: Colors.grey,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carKilometerController,
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
                text: 'current Milage',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.grey,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carKilometerController,
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
                valueTextColor: Colors.grey,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carKilometerController,
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
                text: 'Bootspace',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.grey,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carKilometerController,
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
                valueTextColor: Colors.grey,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carKilometerController,
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
                valueTextColor: Colors.grey,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carKilometerController,
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
                text: 'Car height',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.grey,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carKilometerController,
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
                text: 'Car width',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.grey,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carKilometerController,
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
                text: 'Car length',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.grey,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carKilometerController,
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
                text: 'Ground clearence',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.grey,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carKilometerController,
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
                valueTextColor: Colors.grey,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carKilometerController,
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
                valueTextColor: Colors.grey,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carKilometerController,
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
                valueTextColor: Colors.grey,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carKilometerController,
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
                valueTextColor: Colors.grey,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carKilometerController,
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
                text: 'Fuel Tank',
                enabledBorderColor: Colors.white,
                valueTextColor: Colors.grey,
                focusedBorderColor: Colors.red,
                labelTextColor: Colors.grey,
                controller: carKilometerController,
                warning: 'Please provide appropriate details',
                obscure: false,
                keyBoardType: TextInputType.number,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
        ],
      ),
    );
  }
}