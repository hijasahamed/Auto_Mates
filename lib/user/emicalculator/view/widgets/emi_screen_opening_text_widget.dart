import 'package:auto_mates/user/commonwidgets/animated_text/animated_text_widget.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class EmiScreenOpeningTextWidget extends StatelessWidget {
  const EmiScreenOpeningTextWidget({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextWidget(
              text: 'Car Loan Emi Calculator - Calculate Car EMI in Minutes',
              color: Colors.black,
              size: screenSize.width / 28,
              maxline: true,
              weight: FontWeight.bold),
          SizedBox(
            height: screenSize.height / 500,
          ),
          MyTextWidget(
              text:
                  'Check EMI for cars at Auto Mates and get instant car loan for your dream car',
              color: Colors.black,
              size: screenSize.width / 28,
              maxline: true,
              weight: FontWeight.bold),
          AnimatedTextWidget(textTitle: 'NB: Auto Mates is currently not providing personal loans', beginColor: const Color.fromARGB(255, 254, 254, 254), endColor: const Color.fromARGB(255, 255, 17, 0),textSize: screenSize.width/35,),
          MyTextWidget(
              text: 'Check EMI of your car Loan Amount',
              color: const Color.fromARGB(255, 58, 58, 58),
              size: screenSize.width / 22,
              weight: FontWeight.bold)
        ],
      ),
    );
  }
}
