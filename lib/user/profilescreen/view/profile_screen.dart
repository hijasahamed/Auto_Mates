import 'package:auto_mates/user/appbarbottombar/controller/functions/functions.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/profile_banner_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchUserDetails(), 
      builder: (context, snapshot) {
         if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading user data'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('No user data available'));
        } else{
          UserData user=snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(3),
            child: Stack(
              children: [
                ProfileBannerWidget(screenSize: screenSize,user: user,)
              ],
            ),
          );
        }
      },
    );
  }
}
