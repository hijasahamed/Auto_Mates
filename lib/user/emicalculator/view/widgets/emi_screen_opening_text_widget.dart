import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class EmiScreenOpeningTextWidget extends StatelessWidget {
  const EmiScreenOpeningTextWidget({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19,bottom: 5,top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MyTextWidget(
              text: 'Car Loan Emi Calculator - Calculate Car EMI in Minutes',
              color: Colors.white,
              size: screenSize.width / 25,
              maxline: true,
              weight: FontWeight.bold),
          SizedBox(
            height: screenSize.height / 500,
          ),
          MyTextWidget(
              text:
                  'Check EMI for cars at Auto Mates and get instant car loan for your dream car',
              color: Colors.white,
              size: screenSize.width / 28,
              maxline: true,
              weight: FontWeight.bold),
          MyTextWidget(
              text:
                  'NB: Auto Mates is currently not providing personal loans',
              color: Colors.white,
              size: screenSize.width / 35,
              maxline: true,
              weight: FontWeight.bold),
          MyTextWidget(
              text: 'Check EMI of your car Loan Amount',
              color: Colors.white,
              size: screenSize.width / 22,
              weight: FontWeight.bold)
        ],
      ),
    );
  }
}
