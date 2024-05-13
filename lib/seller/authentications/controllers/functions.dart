import 'package:auto_mates/seller/seller_appbar_bottombar/view/seller_appbar_bottombar_screen.dart';
import 'package:auto_mates/seller/authentications/view/otp_verification_screen.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

String otpWarn =
    'Please enter the OTP (One-Time-Password) sent to your registered phone number to complete your verification.';

String otpSmsCode = '';
String contrryCode = '+91';

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.bold),
  decoration: BoxDecoration(
    border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
    borderRadius: BorderRadius.circular(20),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color: const Color.fromRGBO(234, 239, 243, 1),
  ),
);

Future<void> getOtpButtonClicked(
    {required GlobalKey<FormState> formkey,
    phoneNumberController,
    context,
    screenSize,
    sellerAuthenticationBloc,
    contryCode}) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
  verificationCompleted: (phoneAuthCredential) {},
  verificationFailed: (FirebaseAuthException ex) {},
  codeSent: (String verificationId, forceResendingToken) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => OtpVerificationScreen(
              sellerAuthenticationBloc: sellerAuthenticationBloc,
              screenSize: screenSize,
              verificationId: verificationId,
              phoneNumberController: phoneNumberController,
            )));
  },
  codeAutoRetrievalTimeout: (String verificationId) {},
  phoneNumber: '${contryCode + phoneNumberController.text.toString()}');
}

Future<void> submitOtp(verificationId, smsCode, context) async {
  try {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    FirebaseAuth.instance.signInWithCredential(credential).then(
      (value) async {
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setBool(sellerLogedInKey, true);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const Sellerappbarbottombar()));
      },
    ).catchError((e) {
      snackbarWidget('Invalid OTP', context, Colors.red, Colors.white,
          SnackBarBehavior.floating);
    });
  } catch (x) {
    if (kDebugMode) {
      print(x);
    }
  }
}

Future<void> resendOtp(phoneNumberController) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
      verificationCompleted: (PhoneAuthCredential credential) {
        FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException ex) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
      phoneNumber: contrryCode + phoneNumberController);
}
