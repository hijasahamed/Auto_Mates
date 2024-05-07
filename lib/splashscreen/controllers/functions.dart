import 'package:auto_mates/appbarbottombar/view/appbar_bottombar_screen.dart';
import 'package:auto_mates/authentications/view/user_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const logedInKey = 'Userlogedin';

Future<void> goToLoginScreen(context)async{
  await Future.delayed(const Duration(seconds: 3));
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx){
          return UserLoginScreen();
        }
      )
    );
}


Future<void> checkIfUserLogedin(context)async{
  final sharedPref=await SharedPreferences.getInstance();
  final isLogedin=sharedPref.getBool(logedInKey);
  if(isLogedin==null || isLogedin==false){
    goToLoginScreen(context);
  }
  else{
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const AppbarBottomTabSwitchScreen()));
  }
}