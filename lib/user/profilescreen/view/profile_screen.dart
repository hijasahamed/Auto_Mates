import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyTextWidget(text: 'UserName', color: Colors.black, size: 30, weight: FontWeight.bold),
          ElevatedButton(
              onPressed: () async {
                logoutButtonClicked(context);
              },
              child: const Text('Logout')),
        ],
      ),
    );
  }
}
