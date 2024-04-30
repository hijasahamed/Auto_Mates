import 'package:auto_mates/screens/authentication/ui/widgets/signup_screen_widgets/signup_button_widget.dart';
import 'package:auto_mates/screens/authentication/ui/widgets/signup_screen_widgets/signup_welcome_widget.dart';

import 'package:flutter/material.dart';

class UserSignupScreen extends StatelessWidget {
  const UserSignupScreen({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/wheel.webp'),
          fit: BoxFit.cover,
        )),
        child: Container(
          height: screenSize.height,
          width: screenSize.width,
          color: Colors.black.withOpacity(0.6),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SignupWelcomeWidget(screenSize: screenSize),
                SignupButtonWidget(screenSize: screenSize),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



