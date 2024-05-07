import 'package:auto_mates/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/firebase/fire_base_auth_service.dart';
import 'package:auto_mates/splashscreen/controllers/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void loginButtonClicked(email, password, authenticationBloc, formkey) async {
  if (formkey.currentState!.validate()) {
    User? user = await auth.userLogin(email, password);

    if (user != null) {
      authenticationBloc.add(LoginButtonClickedEvent());
      final sharedPref=await SharedPreferences.getInstance();
      await sharedPref.setBool(logedInKey, true); 
    } else {
      authenticationBloc.add(LoginNotSuccessfullEvent());
    }
  }
}

void signupButtonClicked(
    email, password, authenticationBloc, formkey, context) async {
  if (formkey.currentState!.validate()) {
    User? user = await auth.userSignup(email, password);

    if (user != null) {
      authenticationBloc.add(SignupButtonClickedEvent());
      final sharedPref=await SharedPreferences.getInstance();
      await sharedPref.setBool(logedInKey, true); 
      Future.delayed(const Duration(seconds: 3));
      authenticationBloc.add(SignupSuccessfullAndAccountCreatedEvent());
    }
    // else{
    //   authenticationBloc.add(SignupNotSuccessfullActionState());
    // }
  }
}

snackbarWidget(String text, context,Color color,Color textColor) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    elevation: 10,
    dismissDirection: DismissDirection.horizontal,
    duration: const Duration(milliseconds: 2100),
    behavior: SnackBarBehavior.floating,
    backgroundColor: color,
    margin: const EdgeInsets.all(50),
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
    ),
  ));
}