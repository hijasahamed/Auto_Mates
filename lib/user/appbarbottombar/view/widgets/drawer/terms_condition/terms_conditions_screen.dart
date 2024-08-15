import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50), 
        child: NormalAppBar(title: 'Terms and Conditions')
      ),
      body: Padding(
        padding: EdgeInsets.all(screenSize.width/40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyTextWidget(
                  text: 'Terms and Conditions',
                  color: Colors.blueGrey,
                  size: screenSize.width / 25,
                  weight: FontWeight.w400),
              MyTextWidget(
                  text: 'Last updated: August 13 2024',
                  color: Colors.blueGrey,
                  size: screenSize.width / 25,
                  weight: FontWeight.w400),
              MyTextWidget(
                text:'''Please read these Terms and Conditions carefully before using the AutoMates mobile application.''',
                color: Colors.blueGrey,
                size: screenSize.width / 30,
                weight: FontWeight.w300,
                maxline: true,
              ),
              MyTextWidget(
                  text:
                      '''1. Acceptance of Terms\nBy accessing or using our app, you agree to be bound by these Terms. If you do not agree to these Terms, you may not use the app.''',
                  color: Colors.blueGrey,
                  size: screenSize.width / 30,
                  maxline: true,
                  weight: FontWeight.w300),
              MyTextWidget(
                  text: '''2. Use of the App\nYou must be at least 18 years old to use this app.\nYou agree to use the app only for lawful purposes.\nYou agree not to use the app to sell, distribute, or advertise illegal items or services.''',
                  color: Colors.blueGrey,
                  size: screenSize.width / 30,
                  maxline: true,
                  weight: FontWeight.w300),
              MyTextWidget(
                  text: '''3. Account Registration\nYou must provide accurate and complete information when creating an account.\nYou are responsible for maintaining the confidentiality of your account and password.''',
                  color: Colors.blueGrey,
                  size: screenSize.width / 30,
                  maxline: true,
                  weight: FontWeight.w300),
              MyTextWidget(
                  text: '''4. Buying and Selling\nAutoMates provides a platform to connect buyers and sellers of cars. We are not responsible for the actual transactions between users.\nUsers are responsible for ensuring that the vehicles they buy or sell are in compliance with local laws and regulations.''',
                  color: Colors.blueGrey,
                  size: screenSize.width / 30,
                  maxline: true,
                  weight: FontWeight.w300),
              MyTextWidget(
                  text: '''5. Termination\nWe may terminate or suspend your account immediately if you violate these Terms.''',
                  color: Colors.blueGrey,
                  size: screenSize.width / 30,
                  maxline: true,
                  weight: FontWeight.w300),
              MyTextWidget(
                  text: '''6. Contact Us\nIf you have any questions about these Terms, please contact us at, please contact us at hijasahamed2000@gmail.com.''',
                  color: Colors.blueGrey,
                  maxline: true,
                  size: screenSize.width / 30,
                  weight: FontWeight.w300),
          ],
        ),
      )
    );
  }
}