import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class CurrentPlan extends StatelessWidget {
  const CurrentPlan({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyTextWidget(
            text: 'Current Plan',
            color: Colors.blueGrey,
            size: screenSize.width / 35,
            weight: FontWeight.bold),
        Container(
          height: screenSize.height / 18,
          width: screenSize.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenSize.width / 25),
              color: Colors.red),
          child: Center(
              child: MyTextWidget(
                  text: 'Free Plan ₹0',
                  color: Colors.white,
                  size: screenSize.width / 25,
                  weight: FontWeight.bold)),
        ),
      ],
    );
  }
}
