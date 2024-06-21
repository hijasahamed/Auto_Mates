import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key, required this.screenSize, required this.user});
  final Size screenSize;
  final UserData user;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: screenSize.height / 20,
        ),
        MyTextWidget(
            text: 'Name: ${user.userName}',
            color: const Color(0xFF424141),
            size: screenSize.width / 20,
            maxline: true,
            weight: FontWeight.bold),
        MyTextWidget(
            text: 'Mobile: ${user.mobile}',
            color: const Color(0xFF424141),
            size: screenSize.width / 30,
            weight: FontWeight.bold),
        MyTextWidget(
            text: 'Location: ${user.location}',
            color: const Color(0xFF424141),
            size: screenSize.width / 30,
            weight: FontWeight.bold),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextWidget(
                text: 'Email:',
                color: const Color(0xFF424141),
                size: screenSize.width / 35,
                weight: FontWeight.bold),
            SizedBox(
              width: screenSize.width / 2,
              child: MyTextWidget(
                  text: user.email,
                  color: const Color(0xFF424141),
                  size: screenSize.width / 35,
                  maxline: true,
                  weight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
