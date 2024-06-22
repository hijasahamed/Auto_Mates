import 'dart:io';

import 'package:auto_mates/user/appbarbottombar/view/appbar_bottombar_screen.dart';
import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/authentications/view/user_login_screen.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


final FirebaseAuthService auth = FirebaseAuthService();

String? userEmailStorer;

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

void loginButtonClicked(email, password, authenticationBloc, formkey,context) async {
  if (formkey.currentState!.validate()) {
    authenticationBloc.add(UserLoginLoadingStartEvent());    
    User? user = await auth.userLogin(email, password);
    if (user != null) {
      final sharedPref = await SharedPreferences.getInstance();
      await sharedPref.setBool(logedInKey, true);
      dynamic userData = await checkIfUserAvailable(email);
      await sharedPref.setString('userProfile', userData.userProfile);
      await sharedPref.setString('id', userData.id);
      await sharedPref.setString('email', userData.email);
      await sharedPref.setString('userName', userData.userName);
      await sharedPref.setString('mobile', userData.mobile);
      await sharedPref.setString('location', userData.location); 
      userEmailStorer=userData.email;                
      authenticationBloc.add(LoginButtonClickedEvent());
      authenticationBloc.add(UserLogedinEvent());
    } else {
      authenticationBloc.add(UserLoginLoadingStopEvent());
      authenticationBloc.add(LoginNotSuccessfullEvent());
    }          
  }  
}

class UserData {
  final String userProfile;
  final String id;
  final String userName;
  final String email;
  final String mobile;
  final String location;  
  UserData({required this.userProfile,required this.id, required this.email, required this.userName,required this.location,required this.mobile});
}

Future<UserData?> checkIfUserAvailable(String email) async {
  final CollectionReference signupFirebaseObject =
      FirebaseFirestore.instance.collection('userSignupData');

  try {
    QuerySnapshot querySnapshot =
        await signupFirebaseObject.where('email', isEqualTo: email).get();

    if (querySnapshot.docs.isNotEmpty) {
      QueryDocumentSnapshot doc = querySnapshot.docs.first;
      UserData userData =
          UserData(userProfile: doc['userProfile'],id: doc.id, email: doc['email'], userName: doc['userName'],location: doc['location'],mobile: doc['mobile']);
      return userData;
    } else {
      return null;
    }
  } catch (e) {
    if (kDebugMode) {
      print("Error checking email availability: $e");
    }
  }
  return null;
}

void signupButtonClicked(
    {mobile,
    location,
    userName,
    email,
    password,
    recheckPassword,
    authenticationBloc,
    formkey,
    context}) async {
  if (formkey.currentState!.validate()) {
    if (password == recheckPassword) {
      try {
        UserData? existingUser = await checkIfUserAvailable(email);
        if (existingUser != null) {
          snackbarWidget(
              'This email is already registerd with AutoMates.Please try agian with another email',
              context,
              Colors.blue,
              Colors.white,
              SnackBarBehavior.floating);
        } else {
          User? user = await auth.userSignup(email, password);
          if (user != null) {
            await addUserSignupDatatoDb(username: userName,email: email,location: location,mobile: mobile);
            authenticationBloc.add(SignupButtonClickedEvent());
            final sharedPref = await SharedPreferences.getInstance();
            await sharedPref.setBool(logedInKey, true);
            dynamic userData = await checkIfUserAvailable(email);
            await sharedPref.setString('userProfile', userData.userProfile);           
            await sharedPref.setString('id', userData.id);
            await sharedPref.setString('email', userData.email);
            await sharedPref.setString('userName', userData.userName); 
            await sharedPref.setString('mobile', userData.mobile);
            await sharedPref.setString('location', userData.location);         
            Future.delayed(const Duration(seconds: 3));
            authenticationBloc.add(SignupSuccessfullAndAccountCreatedEvent());
          } else {
            authenticationBloc.add(SignupNotSuccessfullEvent());
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    } else {
      snackbarWidget('Password Recheck failed.Please enter the same password',
          context, Colors.blue, Colors.white, SnackBarBehavior.floating);
    }
  }
}

String? userProfileImage;

addUserProfileImage({bloc})async{
  final file = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(file==null){
    return;
  }
  userProfileImage=file.path;
  bloc.add(UserProfileRefreshEvent());
}

Future<String?> addUserProfileToDb() async {
  if (userProfileImage == null) {
    return null;
  }

  String fileName = DateTime.now().microsecondsSinceEpoch.toString();
  Reference referenceRoot = FirebaseStorage.instance.ref();
  Reference referenceDireImages = referenceRoot.child('images');
  Reference referenceImageToUpload = referenceDireImages.child(fileName);
  
  try {
    await referenceImageToUpload.putFile(File(userProfileImage!));
    String imageUrl = await referenceImageToUpload.getDownloadURL();
    userProfileImage==null;
    return imageUrl;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return null;
  }
}

addUserSignupDatatoDb({username, email,mobile,location}) async{
  final CollectionReference signupFirebaseObject =
      FirebaseFirestore.instance.collection('userSignupData');
  String? imageUrl = await addUserProfileToDb();
  final data = {
    'userProfile':imageUrl,
    'userName': username, 
    'email': email,
    'mobile':mobile,
    'location':location,
    };
  signupFirebaseObject.add(data);
}

logInWithGoogle(authenticationBloc) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      await FirebaseAuth.instance.signInWithCredential(credential);

      String googleEmail=googleSignInAccount.email;
      String userName = googleEmail.split('@')[0].toUpperCase();
      UserData? isExistingUser = await checkIfUserAvailable(googleEmail);

      if(isExistingUser==null){
        await addUserSignupDatatoDb(email: googleEmail,username: userName,location: googleEmail,mobile: googleEmail);
        isExistingUser= await checkIfUserAvailable(googleEmail);
      }

      if(isExistingUser != null){
        authenticationBloc.add(LoginWithGoogleButtonSuccessfulNavigateToScreenEvent());
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setBool(logedInKey, true);
        await sharedPref.setString('id', isExistingUser.id);
        await sharedPref.setString('email', isExistingUser.email);
        await sharedPref.setString('userName', isExistingUser.userName); 
        await sharedPref.setString('mobile', isExistingUser.mobile);
        await sharedPref.setString('location', isExistingUser.location);
      }     
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

resetPassword(resetPasswordcontroller, context) async {
  dynamic email = resetPasswordcontroller.text.trim();
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then(
      (value) {
        snackbarWidget('Password Reset mail sent', context, Colors.white,
            Colors.black, SnackBarBehavior.floating);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => UserLoginScreen(),
        ));
      },
    );
  } on FirebaseAuthException catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}