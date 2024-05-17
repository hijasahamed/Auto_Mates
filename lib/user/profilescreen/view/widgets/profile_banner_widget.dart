import 'package:auto_mates/user/appbarbottombar/controller/functions/functions.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

class ProfileBannerWidget extends StatelessWidget {
  const ProfileBannerWidget({super.key, required this.screenSize,required this.user});
  final Size screenSize;
  final UserData user;
  @override
  Widget build(BuildContext context){
    fetchUserDetails();
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FadeInImage(
            height: screenSize.height / 4,
            width: screenSize.width,          
            placeholder: const AssetImage('assets/images/placeholder.jpg'),
            image: const AssetImage(
              'assets/images/profile_png.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        const Positioned(
              bottom: 30,
              left: 15,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 55,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              )),
          Positioned(
              bottom: 0,
              left: 15,
              child: MyTextWidget(
                  text: user.userName,
                  color: Colors.white,
                  size: 20,
                  weight: FontWeight.bold))
      ],
    );
  }
}
