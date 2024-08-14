import 'package:auto_mates/seller/authentications/controllers/functions.dart';
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
    this.length,
    this.wrapInContainer,
    this.fetchLocation,
    this.isChattingContainer,
    required this.labelTextColor,
    required this.enabledBorderColor,
    required this.focusedBorderColor,
    required this.valueTextColor,
    this.isChat
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
  final bool? length;
  final bool? brandName;
  final bool? wrapInContainer;
  final bool? fetchLocation;
  final Color labelTextColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final Color valueTextColor;
  final bool? isChat;
  final bool? isChattingContainer;

  @override
  Widget build(BuildContext context) {
    Widget textFormFieldObj = TextFormField(
      controller: controller,
      expands: (wrapInContainer==true)? true : false,
      maxLines: (wrapInContainer==true)? null : 1,
      validator: (value) {
        if (value!.isEmpty) {
         return (isChat == true)? null : warning;
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
        else if(fetchLocation==true){
          checkLocationPermission(context: context,locationController: controller);          
        }
        
      },
      obscuringCharacter: '*',
      maxLength: (length ==true)?10 :null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(
          color: Colors.blueGrey, fontWeight: FontWeight.w500),
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
                showBrandSelectionDialog(context: context,brands: carBrands,controller: controller,screenSize: screenSize);
              },),
            )
            : (transmission==true)? DropDownButtonWidget(controller: controller,isTransmission: true,) 
            : (sunroof==true||alloy==true||airConditioner==true||powerWindow==true) ? DropDownButtonWidget(controller: controller,yesOrNoButton: true,)
            : (infotainment==true) ? DropDownButtonWidget(controller: controller,isInfotainment: true,)
            : (bodyType==true) ? DropDownButtonWidget(controller: controller,isbodyType: true,)  
            : const SizedBox(),
        hintText: (isChat == true)? 'Message' : null,
        labelText: (isChat == true) ? null : text,
        labelStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w200),
        fillColor: isChattingContainer == true ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 243, 243, 243),
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

  return (wrapInContainer==true)
  ? SizedBox(
    height: screenSize.height/4,
    width: screenSize.width,
    child: textFormFieldObj,
  )
  : textFormFieldObj;

  }
}
