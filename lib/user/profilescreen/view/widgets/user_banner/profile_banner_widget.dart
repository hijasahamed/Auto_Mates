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
    return Card(
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: .01),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyTextWidget(text: 'My Profile', color: Colors.blueGrey, size: 18, weight: FontWeight.bold),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 58,
                        backgroundColor: Colors.green,
                        child: CircleAvatar(
                          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                          radius: 55,
                          backgroundImage: userImageProvider,
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const MyTextWidget(
                              text: 'Edit Profile',
                              color: Color(0xFF424141),
                              size: 12,
                              weight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(width: screenSize.width/15,),
                  Column(                    
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenSize.height/70,),
                      MyTextWidget(
                          text: 'User Name: ${user.userName}',
                          color: const Color(0xFF424141),
                          size: 20,
                          maxline: true,
                          weight: FontWeight.bold),
                      MyTextWidget(
                          text: 'Mobile: ${user.mobile}',
                          color: const Color(0xFF424141),
                          size: 15,
                          weight: FontWeight.bold),
                      MyTextWidget(
                          text: 'Location: ${user.location}',
                          color: const Color(0xFF424141),
                          size: 15,
                          weight: FontWeight.bold),
                      MyTextWidget(
                          text: 'Email: ${user.email}',
                          color: const Color(0xFF424141),
                          size: 15,
                          weight: FontWeight.bold),
                      
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
