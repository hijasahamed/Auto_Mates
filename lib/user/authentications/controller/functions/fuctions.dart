import 'dart:io';

import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/authentications/view/user_login_screen.dart';
import 'package:auto_mates/user/authentications/view/widgets/login_screen_widgets/google_signup_update_details.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';


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
      authenticationBloc.add(UserLoginLoadingStopEvent());      
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
    authblocInstance,
    formkey,
    context}) async {
  if (formkey.currentState!.validate()) {
    if (password == recheckPassword) {
      authblocInstance.add(UserLoginLoadingStartEvent());
      try {
        UserData? existingUser = await checkIfUserAvailable(email);
        if (existingUser != null) {
          authblocInstance.add(UserLoginLoadingStopEvent());  
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
            final sharedPref = await SharedPreferences.getInstance();
            await sharedPref.setBool(logedInKey, true);
            dynamic userData = await checkIfUserAvailable(email);
            await sharedPref.setString('userProfile', userData.userProfile);           
            await sharedPref.setString('id', userData.id);
            await sharedPref.setString('email', userData.email);
            await sharedPref.setString('userName', userData.userName); 
            await sharedPref.setString('mobile', userData.mobile);
            await sharedPref.setString('location', userData.location);         
            authblocInstance.add(UserLoginLoadingStopEvent());  
            authblocInstance.add(UserLogedinEvent());
          } else {
            authblocInstance.add(UserLoginLoadingStopEvent());
            authblocInstance.add(SignupNotSuccessfullEvent());
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

addUserProfileImage({bloc,editBloc})async{
  final file = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(file==null){
    return;
  }
  userProfileImage=file.path;
  if(bloc != null){
    bloc.add(UserProfileRefreshEvent());
  }
  else if(editBloc != null){
    editBloc.add(EditImageRefreshEvent());
  }
  
}

Future<String?> addUserProfileToDb({fromGoogleSignup}) async {

  if (userProfileImage == null && fromGoogleSignup == true) {
    userProfileImage = await saveAssetImageToFile('assets/images/avatar_image.webp');
  }

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

Future<String?> saveAssetImageToFile(String assetPath) async {
  try {
    // Load the image from assets
    final byteData = await rootBundle.load(assetPath);

    // Get the temporary directory
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/default_profile_image.png');

    // Write the byte data to the file
    await file.writeAsBytes(byteData.buffer.asUint8List());

    // Return the file path
    return file.path;
  } catch (e) {
    if (kDebugMode) {
      print('Error saving asset image to file: $e');
    }
    return null;
  }
}

addUserSignupDatatoDb({username, email,mobile,location}) async{
  final CollectionReference signupFirebaseObject =
      FirebaseFirestore.instance.collection('userSignupData');
  String? imageUrl = await addUserProfileToDb(fromGoogleSignup: true);
  final data = {
    'userProfile':imageUrl,
    'userName': username, 
    'email': email,
    'mobile':mobile,
    'autoMatesCoin' : 0,
    'location':location,
    };
  signupFirebaseObject.add(data);
}

logInWithGoogle(authenticationBloc,context,screenSize) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {

      authenticationBloc.add(LoginWithGoogleLoadingEvent());

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      await FirebaseAuth.instance.signInWithCredential(credential);

      String googleEmail=googleSignInAccount.email;
      String userName = googleEmail.split('@')[0];
      UserData? isExistingUser = await checkIfUserAvailable(googleEmail);
      

      if(isExistingUser == null){
        await addUserSignupDatatoDb(email: googleEmail,username: userName,location: 'No Data',mobile: 'No Data');
        isExistingUser = await checkIfUserAvailable(googleEmail);        
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
          return GoogleSignupUpdateDetails(screenSize: screenSize,authenticationBloc: authenticationBloc,userId: isExistingUser!.id,googleEmail: googleEmail,);
        },));
      }
      else{
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setBool(logedInKey, true);
        await sharedPref.setString('id', isExistingUser.id);
        await sharedPref.setString('email', isExistingUser.email);
        await sharedPref.setString('userName', isExistingUser.userName); 
        await sharedPref.setString('mobile', isExistingUser.mobile);
        await sharedPref.setString('location', isExistingUser.location);
        await sharedPref.setString('userProfile', isExistingUser.userProfile);
        authenticationBloc.add(LoginWithGoogleButtonSuccessfulNavigateToScreenEvent());
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