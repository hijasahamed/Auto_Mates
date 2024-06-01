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
      children: [
        MyTextWidget(text: 'Car Name : ${car['carName']}', color: Colors.white, size: 16, weight: FontWeight.bold),
        MyTextWidget(text: 'Car Number : ${car['carNumber']}', color: Colors.white, size: 16, weight: FontWeight.bold),
      ],
    );
  }
}