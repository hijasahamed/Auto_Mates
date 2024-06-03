import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class CarAndUserDetails extends StatelessWidget {
  const CarAndUserDetails({super.key, required this.data});
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextWidget(
              text: data['userName'],
              color: const Color.fromARGB(255, 111, 111, 111),
              size: 15,
              weight: FontWeight.bold),
          MyTextWidget(
              text: data['userContact'],
              color: const Color.fromARGB(255, 111, 111, 111),
              size: 13,
              weight: FontWeight.bold),
          MyTextWidget(
              text: data['userLocation'],
              color: const Color.fromARGB(255, 111, 111, 111),
              size: 13,
              weight: FontWeight.bold),
          MyTextWidget(
              text: data['carName'],
              color: const Color.fromARGB(255, 111, 111, 111),
              size: 13,
              weight: FontWeight.bold),
          MyTextWidget(
              text: data['carNumber'],
              color: const Color.fromARGB(255, 111, 111, 111),
              size: 13,
              weight: FontWeight.bold),
        ],
      ),
    );
  }
}
