import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

final FirebaseAuthService auth = FirebaseAuthService();

class FirebaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> userLogin(String email, String password) async {
    print(email);
    print(password);
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
    print('auth function working');
    print(email);
    print(password);
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      if (kDebugMode) {
        print('e print $e');
      }
    }
    return null;
  }
}
