import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

class ProfileBannerWidget extends StatelessWidget {
  const ProfileBannerWidget(
      {super.key, required this.screenSize, required this.user});
  final Size screenSize;
  final UserData user;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(10),
        //   child: FadeInImage(
        //     fadeInDuration: const Duration(milliseconds: 400),
        //     height: screenSize.height / 4.5,
        //     width: screenSize.width,
        //     placeholder: const AssetImage('assets/images/placeholder.jpg'),
        //     image: const AssetImage(
        //       'assets/images/profile_png.png',
        //     ),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        Container(
          height: screenSize.height / 4.7,
          width: screenSize.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), 
            image: const DecorationImage(image: AssetImage('assets/images/profile_png.png'),fit: BoxFit.cover)
          ),
        ),
        Positioned(
            bottom: 0,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 55,
                  backgroundImage: AssetImage('assets/images/add image.jpg'),
                ),
                MyTextWidget(
                    text: user.userName,
                    color: Colors.white,
                    size: 20,
                    weight: FontWeight.bold)
              ],
            )),
      ],
    );
  }
}
