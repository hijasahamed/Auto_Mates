import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class ProfileBannerWidget extends StatelessWidget {
  const ProfileBannerWidget(
      {super.key, required this.screenSize, required this.user});
  final Size screenSize;
  final UserData user;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenSize.height / 4.7,
        width: screenSize.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: AssetImage('assets/images/profile_png.png'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 55,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              MyTextWidget(
                  text: user.userName,
                  color: Colors.white,
                  size: 20,
                  weight: FontWeight.bold)
            ],
          ),
        ));
  }
}
