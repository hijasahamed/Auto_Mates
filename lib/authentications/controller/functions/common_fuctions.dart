import 'package:auto_mates/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/authentications/controller/functions/fire_base_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

void loginButtonClicked(email, password, authenticationBloc) async {
  User? user = await auth.userLogin(email, password);

  if (user != null) {
    authenticationBloc.add(LoginButtonClickedEvent());
  } else {
    if (kDebugMode) {
      print('Error in login');
    }
  }
}

void signupButtonClicked(email, password, authenticationBloc) async {
  User? user = await auth.userSignup(email, password);

  if (user != null) {
    authenticationBloc.add(SignupButtonClickedEvent());
  } else {
    if (kDebugMode) {
      print('Error in account creation');
    }
  }
}
