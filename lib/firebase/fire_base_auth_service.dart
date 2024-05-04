import 'package:auto_mates/authentications/controller/bloc/authentication_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

    }

  }catch(e){
    if (kDebugMode) {
      print(e);
    }
  }
}


// forgetPassword(){
//   firebase.auth().sendPasswordResetEmail(email)
//   .then(() => {
//     // Password reset email sent!
//     // ..
//   })
//   .catch((error) => {
//     var errorCode = error.code;
//     var errorMessage = error.message;
//     // ..
//   });
// }


