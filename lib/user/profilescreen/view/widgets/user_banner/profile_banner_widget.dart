import 'dart:io';

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
    ImageProvider userImageProvider;
    Uri uri = Uri.parse(user.userProfile);
    if (uri.isAbsolute) {
      userImageProvider = NetworkImage(user.userProfile);
    } else {
      userImageProvider = FileImage(File(user.userProfile));
    }
    return Container(
        height: screenSize.height / 4.7,
        width: screenSize.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: AssetImage('assets/images/profile_png.png'),
                fit: BoxFit.cover)),
        child: Container(
          height: screenSize.height / 4.7,
          width: screenSize.width,
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      radius: 55,
                      backgroundImage: userImageProvider,
                    ),
                    TextButton(
                        onPressed: () {
                          
                        },
                        child: const MyTextWidget(
                            text: 'Edit Profile',
                            color: Colors.white,
                            size: 12,
                            weight: FontWeight.bold))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyTextWidget(
                        text: 'User Name: ${user.userName}',
                        color: Colors.white,
                        size: 20,
                        maxline: true,
                        weight: FontWeight.bold),
                    MyTextWidget(
                        text: 'Mobile: ${user.mobile}',
                        color: Colors.white,
                        size: 15,
                        weight: FontWeight.bold),
                    MyTextWidget(
                        text: 'Location: ${user.location}',
                        color: Colors.white,
                        size: 15,
                        weight: FontWeight.bold),
                    MyTextWidget(
                        text: 'Email: ${user.email}',
                        color: Colors.white,
                        size: 15,
                        weight: FontWeight.bold),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
