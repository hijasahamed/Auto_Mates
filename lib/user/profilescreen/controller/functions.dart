
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/authentications/view/user_login_screen.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserData?> fetchUserDetails()async{
  final sharedPref=await SharedPreferences.getInstance();
  dynamic id= sharedPref.getString('id');
  dynamic email= sharedPref.getString('email');
  dynamic userName= sharedPref.getString('userName');
  dynamic location= sharedPref.getString('location');
  dynamic mobile= sharedPref.getString('mobile');
  return UserData(id: id, email: email, userName: userName,location: location,mobile: mobile);
}

logoutAlertMessage({context, profileScreenBloc}) {
  return showDialog(
    barrierColor: Colors.black54,
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
                  backgroundColor: WidgetStatePropertyAll(Colors.black26)),
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

Future<void> confirmUserLogout({context}) async {
  final GoogleSignIn googleSignInn = GoogleSignIn();
  await Future.delayed(const Duration(milliseconds: 2500));
  await googleSignInn.signOut();
  await FirebaseAuth.instance.signOut();
  final sharedPref = await SharedPreferences.getInstance();
  await sharedPref.setBool(logedInKey, false); 
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => UserLoginScreen(),
  ));
}


Future<void> removeFavoriteCar({docId,context})async{
  userFavouriteCars.doc(docId).delete();
  snackbarWidget('Car Removed from favourites', context,Colors.blue, Colors.white, SnackBarBehavior.floating);
}


Stream<QuerySnapshot> getInterestedCarsStream(String userContact) {
  return FirebaseFirestore.instance
      .collection('userInterestMarked')
      .where('userContact', isEqualTo: userContact)
      .snapshots();
}