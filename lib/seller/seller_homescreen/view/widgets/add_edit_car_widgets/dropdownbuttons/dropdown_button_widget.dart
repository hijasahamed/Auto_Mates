import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropDownButtonWidget extends StatelessWidget {
  DropDownButtonWidget ({super.key,required this.controller,this.isFuel,this.isTransmission,this.yesOrNoButton,this.isInfotainment,this.isbodyType});
  final bool? isFuel;
  final bool? isInfotainment;
  final bool? isTransmission;
  final bool? yesOrNoButton;
  final bool? isbodyType;
  final TextEditingController controller;
  final List<String> dropdownFuelItems = [
    'Petrol',
    'Diesel',
    'CNG',
    'Electric'
  ];
  final List<String> dropdownTransmissionItems = [
    'Manual',
    'Automatic',
    'CVT',
  ];
  final List<String> yesOrNo=['Yes','No'];
  final List<String> infotainment=['Digital','Sterio'];
  final List<String> bodytypes=['Hatchback', 'Sedan', 'SUV', 'MUV', 'Coupe', 'Convertible'];
  final List<String> blank = [];
  
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: DropdownButton<String>(
        underline: const SizedBox(),
        dropdownColor: Colors.white,
        style: const TextStyle(color: Color.fromARGB(255, 135, 135, 135),fontWeight: FontWeight.bold),
        elevation: 5,
        value: selectedItem,
        items: (isFuel==true) ? 
        dropdownFuelItems.map((String item) {
          return DropdownMenuItem<String>(
            alignment: Alignment.center,
            value: item,
            child: Text(item),
          );
        }).toList()
        : (isTransmission==true) ?
        dropdownTransmissionItems.map((String item) {
          return DropdownMenuItem<String>(
            alignment: Alignment.center,
            value: item,
            child: Text(item),
          );
        }).toList()
        : (yesOrNoButton==true) ?
          yesOrNo.map((String item) {
          return DropdownMenuItem<String>(
            alignment: Alignment.center,
            value: item,
            child: Text(item),
          );
        }).toList()
        : (isInfotainment==true) ?
          infotainment.map((String item) {
          return DropdownMenuItem<String>(
            alignment: Alignment.center,
            value: item,
            child: Text(item),
          );
        }).toList()
        : (isbodyType==true) ?
          bodytypes.map((String item) {
          return DropdownMenuItem<String>(
            alignment: Alignment.center,
            value: item,
            child: Text(item),
          );
        }).toList()
        : blank.map((String item) {
          return DropdownMenuItem<String>(
            alignment: Alignment.center,
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (value) {
          controller.text = value.toString();
        },
      ),
    );
  }
}
