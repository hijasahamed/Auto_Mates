import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget(
      {super.key,
      required this.text,
      required this.controller,
      required this.warning,
      required this.obscure,
      required this.keyBoardType,
      required this.textCapitalization});
  final String text;
  final String warning;
  final TextEditingController controller;
  final bool obscure;
  final TextInputType keyBoardType;
  final TextCapitalization textCapitalization;
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(
          color: Color(0xFF424141), fontWeight: FontWeight.normal),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(
            color: Color.fromARGB(255, 86, 86, 86),
            fontWeight: FontWeight.normal),
        fillColor: Colors.white,
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
