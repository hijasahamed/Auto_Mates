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
                controller: carKilometerController,
                warning: 'Enter the exact kilometers the car driven',
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