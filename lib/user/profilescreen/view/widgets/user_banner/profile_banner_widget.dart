import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
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
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                radius: 40,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              MyTextWidget(
                  text: user.userName,
                  color: Colors.white,
                  size: 25,
                  weight: FontWeight.bold),
              TextButton(onPressed: () {
                
                }, 
                child: const MyTextWidget(text: 'Edit Profile', color: Colors.white, size: 12, weight: FontWeight.bold)
              )
            ],
          ),
        ));
  }
}
