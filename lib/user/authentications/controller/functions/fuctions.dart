import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/authentications/view/user_login_screen.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuthService auth = FirebaseAuthService();

class FirebaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> userLogin(String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
          
      return credential.user;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  Future<User?> userSignup(String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}


 void loginButtonClicked(email, password, authenticationBloc, formkey) async {
  if (formkey.currentState!.validate()) {
    User? user = await auth.userLogin(email, password);
    Future<List<Map<String, dynamic>>> userDetail=checkIfUserAvailable();
    if (user != null) {
      authenticationBloc.add(LoginButtonClickedEvent());
      final sharedPref = await SharedPreferences.getInstance();
      await sharedPref.setBool(logedInKey, true);
    } else {
      authenticationBloc.add(LoginNotSuccessfullEvent());
    }
  }
}


Future<List<Map<String, dynamic>>> checkIfUserAvailable() async {
  final CollectionReference signupFirebaseObject =
      FirebaseFirestore.instance.collection('userSignupData');

  List<Map<String, dynamic>> userDataList = [];

  try {
    QuerySnapshot querySnapshot = await signupFirebaseObject.get();
    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;
      userData['id'] = doc.id;
      userDataList.add(userData);
    });
  } catch (error) {
    print("Error retrieving user data: $error");
  }
  return userDataList;
}


void signupButtonClicked({userName,email, password,recheckPassword, authenticationBloc, formkey, context}) async {
  if (formkey.currentState!.validate()) {
    if(password==recheckPassword){
      try {
     User? user = await auth.userSignup(email, password);
      if (user != null) {
        await addUserSignupDatatoDb(userName, email, password);
        authenticationBloc.add(SignupButtonClickedEvent());
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setBool(logedInKey, true);
        Future.delayed(const Duration(seconds: 3));
        authenticationBloc.add(SignupSuccessfullAndAccountCreatedEvent());
      } else {
        authenticationBloc.add(SignupNotSuccessfullEvent());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    }
    else{
      snackbarWidget('Password Recheck failed.Please enter the same password', context, Colors.blue, Colors.white, SnackBarBehavior.floating);
    }
  }
}

addUserSignupDatatoDb(username,email,password){
  final CollectionReference signupFirebaseObject =
    FirebaseFirestore.instance.collection('userSignupData');
  final data={
    'userName':username,
    'email':email,
    'password':password
  };
  signupFirebaseObject.add(data);
}


logInWithGoogle(authenticationBloc)async{
  final GoogleSignIn googleSignIn = GoogleSignIn();
  try{

    final GoogleSignInAccount? googleSignInAccount =await googleSignIn.signIn();

    if(googleSignInAccount != null){
      final GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;

      final AuthCredential credential=GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      authenticationBloc.add(LoginWithGoogleButtonSuccessfulNavigateToScreenEvent());

      final sharedPref=await SharedPreferences.getInstance();
      await sharedPref.setBool(logedInKey, true);

    }

  }catch(e){
    if (kDebugMode) {
      print(e);
    }
  }
}


resetPassword(resetPasswordcontroller,context)async{
 dynamic email=resetPasswordcontroller.text.trim();
 try{
  await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {
    snackbarWidget('Password Reset mail sent', context, Colors.white, Colors.black, SnackBarBehavior.floating);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => UserLoginScreen(),
          ));
  },);
 }on FirebaseAuthException catch(e){
  if (kDebugMode) {
    print(e);
  }
 }
}



