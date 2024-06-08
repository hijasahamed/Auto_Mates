// ignore_for_file: must_be_immutable

import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class FilterWithFuelType extends StatelessWidget {
  FilterWithFuelType({super.key, required this.screenSize});
  final Size screenSize;

  bool isDropdownVisible = false;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyTextWidget(text: 'Fuel Type', color: Color.fromARGB(255, 136, 136, 136), size: 15, weight: FontWeight.w700),
            Container(
                height: screenSize.height / 13,
                width: screenSize.width,
                color: const Color.fromARGB(255, 244, 244, 244),
                child: Center(
                  child: TextField(
                    keyboardType: TextInputType.none,                    
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                           isDropdownVisible = !isDropdownVisible;
                        }, 
                        icon: Icon(isDropdownVisible ? Icons.arrow_drop_up_rounded : Icons.arrow_drop_down_rounded,size: 35,color: Colors.grey,)
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                )
              ),
              if (isDropdownVisible)
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                height: 300,
                width: screenSize.width,
                color: const Color.fromARGB(255, 244, 244, 244),                
              ),
            ),
          ],
        ));
  }
}
