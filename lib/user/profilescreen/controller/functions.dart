import 'package:auto_mates/user/authentications/view/user_login_screen.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

logoutAlertMessage({context, profileScreenBloc}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const MyTextWidget(
            text: 'Logout',
            color: Color(0xFF424141),
            size: 26,
            weight: FontWeight.bold),
        content: const MyTextWidget(
            text: 'Do you want to Logout from AutoMates',
            color: Color(0xFF424141),
            size: 15,
            weight: FontWeight.bold),
        actions: [
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black12)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const MyTextWidget(
                  text: 'Back',
                  color: Colors.white,
                  size: 12,
                  weight: FontWeight.bold)),
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red)),
              onPressed: () {
                profileScreenBloc.add(ConfirmLogoutEvent());
              },
              child: const MyTextWidget(
                  text: 'Logout',
                  color: Colors.white,
                  size: 12,
                  weight: FontWeight.bold)),
        ],
      );
    },
  );
}

Future<void> confirmUserLogout(context) async {
  await Future.delayed(const Duration(milliseconds: 2500));
  await FirebaseAuth.instance.signOut();
  final sharedPref = await SharedPreferences.getInstance();
  await sharedPref.setBool(logedInKey, false);
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => UserLoginScreen(),
  ));
}



