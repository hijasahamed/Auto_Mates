import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: NormalAppBar(title: 'Privacy Policy',)),
      body: Padding(
        padding: EdgeInsets.all(screenSize.width / 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyTextWidget(
                text: 'Privacy Policy',
                color: Colors.blueGrey,
                size: screenSize.width / 25,
                weight: FontWeight.w400),
            MyTextWidget(
                text: 'Last updated: August 13 2024',
                color: Colors.blueGrey,
                size: screenSize.width / 25,
                weight: FontWeight.w400),
            MyTextWidget(
              text:
                  'Your privacy is important to us. This Privacy Policy explains how AutoMates collects, uses, and discloses your information when you use our app. By using AutoMates, you agree to the collection and use of information in accordance with this policy.',
              color: Colors.blueGrey,
              size: screenSize.width / 30,
              weight: FontWeight.w300,
              maxline: true,
            ),
            MyTextWidget(
                text:
                    '''1. Information We Collect Personal Information:\nWhen you register an account, we may collect information such as your name, email address, phone number, and payment information. Usage Data: We may collect information about how the app is accessed and used, including your IP address, browser type, and device information.''',
                color: Colors.blueGrey,
                size: screenSize.width / 30,
                maxline: true,
                weight: FontWeight.w300),
            MyTextWidget(
                text: '''2. How We Use Your Information\n To provide and maintain our service\n To notify you about changes to our app\n To provide customer support\n To gather analysis to improve our app\n To detect, prevent, and address technical issues''',
                color: Colors.blueGrey,
                size: screenSize.width / 30,
                maxline: true,
                weight: FontWeight.w300),
            MyTextWidget(
                text: '''3. Sharing Your Information\nWe do not share your personal information with third parties except as necessary to provide the services you have requested, comply with the law, or protect our rights.''',
                color: Colors.blueGrey,
                size: screenSize.width / 30,
                maxline: true,
                weight: FontWeight.w300),
            MyTextWidget(
                text: '''4. Security of Your Information\nWe use commercially reasonable safeguards to protect your personal information. However, no method of transmission over the Internet is 100% secure.''',
                color: Colors.blueGrey,
                size: screenSize.width / 30,
                maxline: true,
                weight: FontWeight.w300),
            MyTextWidget(
                text: '''5. Changes to This Privacy Policy\nWe may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.''',
                color: Colors.blueGrey,
                size: screenSize.width / 30,
                maxline: true,
                weight: FontWeight.w300),
            MyTextWidget(
                text: '''6. Contact Us\nIf you have any questions about this Privacy Policy, please contact us at hijasahamed2000@gmail.com.''',
                color: Colors.blueGrey,
                maxline: true,
                size: screenSize.width / 30,
                weight: FontWeight.w300),
          ],
        ),
      ),
    );
  }
}
