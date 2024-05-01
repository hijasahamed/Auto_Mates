
import 'package:auto_mates/screens/authentication/view/widgets/signup_screen_widgets/add_textform_field_widget.dart';
import 'package:auto_mates/screens/authentication/view/widgets/signup_screen_widgets/back_to_login_screen_widget.dart';
import 'package:flutter/material.dart';

class SignupWelcomeWidget extends StatelessWidget {
  const SignupWelcomeWidget({super.key,required this.screenSize,});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height / 1.8,
      width: screenSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Spacer(),
          const Column(
            children: [
              Text('Create Account To Explore More',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
              Text(
                'Signup',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          const Spacer(),
          AddTextformFieldWidget(screenSize: screenSize),
          const BackToLoginScreenWidget(),
        ],
      ),
    );
  }
}