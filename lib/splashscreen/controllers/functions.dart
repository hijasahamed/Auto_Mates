import 'package:auto_mates/appbarbottombar/view/appbar_bottombar_screen.dart';
import 'package:auto_mates/authentications/view/user_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const logedInKey = 'Userlogedin';

Future<void> goToLoginScreen(context)async{ 
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
    await Future.delayed(const Duration(milliseconds: 3150));
    goToLoginScreen(context);
  }
  else{
    await Future.delayed(const Duration(milliseconds: 3150));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const AppbarBottomTabSwitchScreen()));
  }
}