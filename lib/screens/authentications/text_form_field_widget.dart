import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({super.key,required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
              fillColor: const Color(0xFF143A42),
              filled: true,
              enabledBorder: const OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(10))),
              focusedBorder: const OutlineInputBorder(                                 
                  borderRadius:
                      BorderRadius.all(Radius.circular(10))),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),                    
              ),
            ),
      ),
    );
  }
}