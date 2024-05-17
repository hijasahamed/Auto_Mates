import 'package:auto_mates/user/authentications/view/user_login_screen.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> logoutButtonClicked(context) async {
  FirebaseAuth.instance.signOut();
  final sharedPref = await SharedPreferences.getInstance();
  await sharedPref.setBool(logedInKey, false);
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => UserLoginScreen(),
  ));
}
