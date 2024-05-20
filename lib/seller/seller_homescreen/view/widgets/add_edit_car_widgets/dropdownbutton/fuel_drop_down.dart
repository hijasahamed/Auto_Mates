import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FuelDropDown extends StatelessWidget {
  FuelDropDown({super.key,required this.controller});
 final TextEditingController controller;
 final List<String> dropdownFuelItems = [
    'Petrol',
    'Diesel',
    'CNG',
    'Electric'
  ];
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: DropdownButton<String>(
        underline: const SizedBox(),
        elevation: 5,
        value: selectedItem,
        items: dropdownFuelItems.map((String item) {
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
