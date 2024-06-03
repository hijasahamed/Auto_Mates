import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class UserInterestedDetailsHolder extends StatelessWidget {
  const UserInterestedDetailsHolder({super.key, required this.screenSize, required this.car});
  final Size screenSize;
  final dynamic car;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyTextWidget(text: car['CarBrand'], color: const Color.fromARGB(255, 79, 79, 79), size: 20, weight: FontWeight.bold),
        MyTextWidget(text: car['carName'], color: const Color.fromARGB(255, 79, 79, 79), size: 17, weight: FontWeight.w600),
        MyTextWidget(text: car['carNumber'], color: const Color.fromARGB(255, 79, 79, 79), size: 13, weight: FontWeight.w600),
        MyTextWidget(text: '₹${car['carRate']} Lakhs', color: Colors.green, size: 16, weight: FontWeight.bold),
      ],
    );
  }
}