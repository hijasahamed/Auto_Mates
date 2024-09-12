import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class CarImageCount extends StatelessWidget {
  const CarImageCount(
      {super.key, required this.screenSize, required this.data});
  final Size screenSize;
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 7,
        right: 7,
        child: Container(
          height: screenSize.height / 32,
          width: screenSize.width / 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenSize.width/75), color: Colors.black38),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.filter,
                color: Colors.white,
                size: screenSize.width/28,
              ),
              MyTextWidget(
                  text: data['image'].length.toString(),
                  color: Colors.white,
                  size: screenSize.width/28,
                  weight: FontWeight.w500),
            ],
          ),
        ));
  }
}
