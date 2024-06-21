
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/user_banner/edit_profile/edit_profile_button.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/user_banner/profile_image/user_profile_image.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/user_banner/user_details/user_details.dart';
import 'package:flutter/material.dart';

class ProfileBannerWidget extends StatelessWidget {
  const ProfileBannerWidget(
      {super.key, required this.screenSize, required this.user});
  final Size screenSize;
  final UserData user;
  @override
  Widget build(BuildContext context) {    
    return Card(
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 238, 238, 238),
          border: Border.all(width: .01),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  MyTextWidget(text: 'My Profile', color: const Color(0xFF424141), size: screenSize.width/25, weight: FontWeight.bold),
                  SizedBox(height: screenSize.height/125,),
                  UserProfileImage(screenSize: screenSize, user: user),
                  const EditProfileButton()
                ],
              ),
              SizedBox(width: screenSize.width/15,),
              UserDetails(screenSize: screenSize, user: user)
            ],
          ),
        ),
      ),
    );
  }
}
