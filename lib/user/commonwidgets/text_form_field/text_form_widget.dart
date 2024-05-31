import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/dropdownbuttons/car_brand_drop_down.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/dropdownbuttons/dropdown_button_widget.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/dropdownbuttons/insurence_date_picker.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/dropdownbuttons/year_picker.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextFormWidget extends StatelessWidget {
 const MyTextFormWidget({
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
    this.insurenceDate,
    this.infotainment,
    this.alloy,
    this.airConditioner,
    this.bodyType,
    this.powerWindow,
    this.fuel,
    this.sunroof,
    this.transmission,
    this.brandName,
    required this.labelTextColor,
    required this.enabledBorderColor,
    required this.focusedBorderColor,
    required this.valueTextColor
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
  final bool? insurenceDate;
  final bool? fuel;
  final bool? alloy;
  final bool? bodyType;
  final bool? powerWindow;
  final bool? airConditioner;
  final bool? infotainment;
  final bool? sunroof;
  final bool? transmission;
  final bool? brandName;
  final Color labelTextColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final Color valueTextColor;

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
        else if(insurenceDate==true){
          await insurenceDatePicker(context: context,controller: controller);
        }
        
      },
      obscuringCharacter: '*',
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
          color: valueTextColor, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        suffixIcon: (fuel == true)
            ? DropDownButtonWidget (controller: controller,isFuel: true,) 
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
            : (transmission==true)? DropDownButtonWidget(controller: controller,isTransmission: true,) 
            : (sunroof==true||alloy==true||airConditioner==true||powerWindow==true) ? DropDownButtonWidget(controller: controller,yesOrNoButton: true,)
            : (infotainment==true) ? DropDownButtonWidget(controller: controller,isInfotainment: true,)
            : (bodyType==true) ? DropDownButtonWidget(controller: controller,isbodyType: true,)  
            : const SizedBox(),
        labelText: text,
        labelStyle: TextStyle(
            color: labelTextColor,
            fontWeight: FontWeight.w400),
        fillColor: fillColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: enabledBorderColor),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusedBorderColor),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        border: OutlineInputBorder(          
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
