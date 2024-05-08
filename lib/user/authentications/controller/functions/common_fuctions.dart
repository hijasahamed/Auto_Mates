import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/firebase/fire_base_auth_service.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

void loginButtonClicked(email, password, authenticationBloc, formkey) async {
  if (formkey.currentState!.validate()) {
    User? user = await auth.userLogin(email, password);

    if (user != null) {
      authenticationBloc.add(LoginButtonClickedEvent());
      final sharedPref = await SharedPreferences.getInstance();
      await sharedPref.setBool(logedInKey, true);
    } else {
      authenticationBloc.add(LoginNotSuccessfullEvent());
    }
  }
}

void signupButtonClicked(
    email, password, authenticationBloc, formkey, context) async {
  if (formkey.currentState!.validate()) {

    try {
     User? user = await auth.userSignup(email, password);
      if (user != null) {
        authenticationBloc.add(SignupButtonClickedEvent());
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setBool(logedInKey, true);
        Future.delayed(const Duration(seconds: 3));
        authenticationBloc.add(SignupSuccessfullAndAccountCreatedEvent());
      } else {
        authenticationBloc.add(SignupNotSuccessfullActionState());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}


