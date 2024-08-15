import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class SubText extends StatelessWidget {
  const SubText({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return MyTextWidget(
                text: 'Upgrade to a new plan to enjoy more benefits',
                color: Colors.grey,
                size: screenSize.width / 30,
                weight: FontWeight.bold);
  }
}