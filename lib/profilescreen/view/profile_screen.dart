import 'package:auto_mates/authentications/view/user_login_screen.dart';
import 'package:auto_mates/splashscreen/controllers/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              final sharedPref = await SharedPreferences.getInstance();
              await sharedPref.setBool(logedInKey, false);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => UserLoginScreen(),
              ));
            },
            child: const Text('Logout')),
      ),
    );
  }
}
