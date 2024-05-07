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
      authenticationBloc.add(SignupSuccessfullAndAccountCreatedEvent());
    }
  }
}

snackbarWidget(String text, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    elevation: 10,
    dismissDirection: DismissDirection.horizontal,
    duration: const Duration(milliseconds: 2100),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.blue,
    margin: const EdgeInsets.all(50),
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
    ),
  ));
}