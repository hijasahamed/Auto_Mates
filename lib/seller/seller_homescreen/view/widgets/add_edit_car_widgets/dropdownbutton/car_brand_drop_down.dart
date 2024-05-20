import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarBrandDropDown extends StatelessWidget {
  CarBrandDropDown({super.key,required this.controller});
  final TextEditingController controller;
  String? selectedItem;
  final List<String> brands=['Maruthi Suzuki','Toyota','Honda','Skoda','Mahindra'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: DropdownButton<String>(
        underline: const SizedBox(),
        elevation: 5,
        value: selectedItem,
        items: brands.map((String item) {
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