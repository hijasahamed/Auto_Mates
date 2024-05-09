import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

class CreateAccountWelcomeScreen extends StatelessWidget {
  const CreateAccountWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MyTextWidget(text: 'Create Account', color: Colors.white, size: 45, weight: FontWeight.bold),
        MyTextWidget(text: 'Sell Car Easily With AutoMates', color: Colors.white, size: 20, weight: FontWeight.bold)
      ],
    );
  }
}