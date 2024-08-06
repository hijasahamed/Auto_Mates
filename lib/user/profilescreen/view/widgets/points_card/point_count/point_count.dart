import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:flutter/material.dart';

class PointCount extends StatelessWidget {
  const PointCount({super.key, required this.screenSize, required this.user});
  final Size screenSize;
  final UserData user;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StreamBuilder<Object>(
            stream: getUserCoins(user.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(
                  color: Colors.blue,
                );
              } else {
                return MyTextWidget(
                  text: snapshot.data.toString(),
                  color: Colors.grey,
                  size: screenSize.width / 15,
                  weight: FontWeight.bold,
                );
              }
            }),
        SizedBox(
          width: screenSize.width / 75,
        ),
        MyTextWidget(
            text: 'Coins Available',
            color: Colors.grey,
            size: screenSize.width / 30,
            weight: FontWeight.w600),
      ],
    );
  }
}
