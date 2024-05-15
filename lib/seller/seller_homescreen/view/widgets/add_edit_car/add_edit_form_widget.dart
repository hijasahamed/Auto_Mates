import 'package:auto_mates/user/authentications/view/widgets/signup_screen_widgets/text_form_widget.dart';
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
    required this.carYearController
  });
  final TextEditingController carBrandController ;
  final TextEditingController carModelNameController;
  final TextEditingController carColorController ;
  final TextEditingController carYearController ;
  final TextEditingController carPriceController ;
  final TextEditingController carFuelController;
  final TextEditingController carKilometerController ;
  final GlobalKey<FormState> postCarFormkey ;
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
            child: TextFormWidget(
                text: 'Brand Name',
                controller: carBrandController,
                warning: 'Enter value',
                obscure: false,
                keyBoardType: TextInputType.name,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormWidget(
                text: 'Model Name',
                controller: carModelNameController,
                warning: 'Enter value',
                obscure: false,
                keyBoardType: TextInputType.name,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormWidget(
                text: 'Color',
                controller: carColorController,
                warning: 'Enter value',
                obscure: false,
                keyBoardType: TextInputType.name,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormWidget(
                text: 'Year',
                controller: carYearController,
                warning: 'Enter value',
                obscure: false,
                keyBoardType: TextInputType.number,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormWidget(
                text: 'Price',
                controller: carPriceController,
                warning: 'Enter value',
                obscure: false,
                keyBoardType: TextInputType.name,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormWidget(
                text: 'Fuel',
                controller: carFuelController,
                warning: 'Enter value',
                obscure: false,
                keyBoardType: TextInputType.name,
                textCapitalization:
                    TextCapitalization.words,
                fillColor: const Color(0XFFDBEDF5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormWidget(
                text: 'Kilometers',
                controller: carKilometerController,
                warning: 'Enter value',
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