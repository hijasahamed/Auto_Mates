import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({super.key,required this.hintText,this.icon}); 
  final String hintText;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
      child: TextFormField(
        style: const TextStyle(color: Color(0xFF424141),fontWeight: FontWeight.normal),
        decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Color.fromARGB(255, 86, 86, 86),fontWeight: FontWeight.normal),
              suffixIcon: icon,
              fillColor: const Color(0xFFDBEDF5),
              filled: true,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                  borderRadius:
                      BorderRadius.all(Radius.circular(10))),
              focusedBorder: const OutlineInputBorder( 
                borderSide: BorderSide(color: Colors.white),                                
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