import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class CreateAccountWelcomeScreen extends StatelessWidget {
  const CreateAccountWelcomeScreen({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: MyTextWidget(
          text: 'Sell Cars Easily With AutoMates',
          color: Colors.blueGrey,
          size: screenSize.width/20,
          weight: FontWeight.bold),
    );
  }
}
