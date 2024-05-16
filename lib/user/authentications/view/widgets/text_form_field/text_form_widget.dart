import 'package:flutter/material.dart';

class MyTextFormWidget extends StatelessWidget {
  const MyTextFormWidget(
      {super.key,
      required this.text,
      required this.controller,
      required this.warning,
      required this.obscure,
      required this.keyBoardType,
      required this.textCapitalization,
      required this.fillColor,
      required this.screenSize
      });
  final String text;
  final String warning;
  final TextEditingController controller;
  final bool obscure;
  final TextInputType keyBoardType;
  final TextCapitalization textCapitalization;
  final Color fillColor;
  final Size screenSize;
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
      obscuringCharacter: '*',
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(
          color: Color(0xFF424141), fontWeight: FontWeight.normal),
      decoration: InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(
            color: Color(0xFF424141),
            fontWeight: FontWeight.w400),
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
