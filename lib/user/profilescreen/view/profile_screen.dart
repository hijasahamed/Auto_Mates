import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/profile_banner.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfileBanner(screenSize: screenSize),
            ElevatedButton(
                onPressed: () async {
                  logoutButtonClicked(context);
                },
                child: const Text('Logout')),
          ],
        ),
      ),
    );
  }
}
