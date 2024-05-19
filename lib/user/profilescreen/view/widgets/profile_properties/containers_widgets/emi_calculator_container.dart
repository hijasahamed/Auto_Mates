import 'package:flutter/material.dart';

class EmiCalculatorContainer extends StatelessWidget {
  const EmiCalculatorContainer({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
        color: Colors.green
      ),
      height: screenSize.height/7,
      child: InkWell(
        onTap: () {
          
        },      
      ),
        ),
    );
  }
}