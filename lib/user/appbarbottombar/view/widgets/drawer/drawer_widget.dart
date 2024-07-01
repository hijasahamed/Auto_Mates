import 'package:auto_mates/user/appbarbottombar/view/widgets/drawer/drawer_list_tiles/drawer_list_tile_widget.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/user_banner/edit_profile/edit_screen/editing_screen.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/user_banner/profile_image/user_profile_image.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
        width: screenSize.width/1.22,
        child: Column(
          children: [
            FutureBuilder(
              future: fetchUserDetails(), 
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: MyTextWidget(text: 'No Data', color: Colors.black, size: screenSize.width/35, weight: FontWeight.bold),);
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Center(child: MyTextWidget(text: 'No Data', color: Colors.black, size: screenSize.width/35, weight: FontWeight.bold),);
                }
                else{
                  UserData user = snapshot.data!;
                  return DrawerHeader(
                    decoration: const BoxDecoration(
                      // color: Color.fromARGB(255, 22, 190, 118)
                      color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,        
                      children: [
                        UserProfileImage(screenSize: screenSize, user: user),
                        SizedBox(width: screenSize.width/30,),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyTextWidget(text: 'Hello', color: Colors.blueGrey, size: screenSize.width/35, weight: FontWeight.bold),
                              MyTextWidget(text: user.userName, color: Colors.blueGrey, size: screenSize.width/22, weight: FontWeight.bold),
                            ],
                          ),
                        ),
                        const Spacer(),
                        IconButton(onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return EditingScreen(screenSize: screenSize, user: user);
                          },));
                        }, icon: const Icon(Icons.edit,color: Colors.blueGrey,)),
                      ],
                    ),
                  );
                }
              },
            ),
            DrawerListtileWidget(leadingIcon: Icons.rule_sharp, title: 'Terms & Conditions',screenSize: screenSize,termsAndConditons: true,),
            DrawerListtileWidget(leadingIcon: Icons.privacy_tip_outlined, title: 'Privacy Policy',screenSize: screenSize,privecyPolicy: true,),
            DrawerListtileWidget(leadingIcon: Icons.info_outline, title: 'About',screenSize: screenSize,about: true,),
            const Spacer(),
            SizedBox(
              height: screenSize.height/9,
              child: Center(child: MyTextWidget(text: 'Version 1.0.0', color: Colors.blueGrey, size: screenSize.width/28, weight: FontWeight.bold),),
            )
          ],
        ),
      );
  }
}