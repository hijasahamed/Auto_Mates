import 'package:auto_mates/user/authentications/view/user_login_screen.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

sellerLogout({context,screenSize})async{
  Navigator.of(context).pushReplacement(MaterialPageRoute(
  builder: (context) => UserLoginScreen()  ));
  final sharedPref = await SharedPreferences.getInstance();
  await sharedPref.setBool(sellerLogedInKey, true);
}