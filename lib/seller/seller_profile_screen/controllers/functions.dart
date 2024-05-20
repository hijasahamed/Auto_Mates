import 'package:auto_mates/user/authentications/view/user_login_screen.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

sellerLogout({context,})async{
  final sharedPref = await SharedPreferences.getInstance();
  await sharedPref.setBool(sellerLogedInKey, false);
  Navigator.of(context).pushReplacement(MaterialPageRoute(
  builder: (context) => UserLoginScreen()));  
}