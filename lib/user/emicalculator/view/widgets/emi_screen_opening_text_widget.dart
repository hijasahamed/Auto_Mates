import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class EmiScreenOpeningTextWidget extends StatelessWidget {
  const EmiScreenOpeningTextWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyTextWidget(text: 'Car Loan Emi Calculator - Calculate Car EMI in Minutes', color: Colors.black, size: 18, weight: FontWeight.bold),
          SizedBox(height: screenSize.height/500,),
          const MyTextWidget(text: 'Check EMI for cars at Auto Mates and get instant car loan for your dream car', color: Colors.black, size: 17, weight: FontWeight.bold),
          const MyTextWidget(text: 'Customize Car Loan EMI ', color: Colors.black, size: 21, weight: FontWeight.bold)
        ],
      ),
    );
  }
}