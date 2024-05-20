import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/dropdownbutton/car_brand_drop_down.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/dropdownbutton/fuel_drop_down.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/year_picker.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextFormWidget extends StatelessWidget {
  MyTextFormWidget({
    super.key,
    required this.text,
    required this.controller,
    required this.warning,
    required this.obscure,
    required this.keyBoardType,
    required this.textCapitalization,
    required this.fillColor,
    required this.screenSize,
    this.datePicker,
    this.fuel,
    this.brandName
  });
  final String text;
  final String warning;
  final TextEditingController controller;
  final bool obscure;
  final TextInputType keyBoardType;
  final TextCapitalization textCapitalization;
  final Color fillColor;
  final Size screenSize;
  final bool? datePicker;
  final bool? fuel;
  final bool? brandName;

  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return warning;
        }
        return null;
      },
      textCapitalization: textCapitalization,
      keyboardType: keyBoardType,
      obscureText: obscure,
      onTap: () async {
        if (datePicker == true) {
          await selectYear(context, controller, screenSize);
        }
      },
      obscuringCharacter: '*',
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(
          color: Color(0xFF424141), fontWeight: FontWeight.normal),
      decoration: InputDecoration(
        suffixIcon: (fuel == true)
            ? FuelDropDown(controller: controller) 
            : (brandName==true)
            ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(child: SizedBox(
                height: screenSize.height/50,
                width: screenSize.width/50,
                child: const Icon(Icons.arrow_drop_down)),onTap: () {
                showBrandSelectionDialog(context: context,brands: brands,controller: controller);
              },),
            )
            :const SizedBox(),
        labelText: text,
        labelStyle: const TextStyle(
            color: Color(0xFF424141), fontWeight: FontWeight.bold),
        fillColor: fillColor,
        filled: true,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
