import 'package:auto_mates/seller/appbar_bottombar/sellerappbarbottombar.dart';
import 'package:auto_mates/seller/authentications/view/otp_verification_screen.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

String otpWarn =
    'Please enter the OTP (One-Time-Password) sent to your registered phone number to complete your verification.';

String otpSmsCode='';
String contrryCode='+91';

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
    phoneNumberController, context, screenSize,sellerAuthenticationBloc,contryCode) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
    verificationCompleted: (phoneAuthCredential) {},
    verificationFailed: (FirebaseAuthException ex) {},
    codeSent: (String verificationId, forceResendingToken) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OtpVerificationScreen(
            sellerAuthenticationBloc:sellerAuthenticationBloc,
                screenSize: screenSize,
                verificationId: verificationId,
              )));
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
    phoneNumber: '${contryCode+phoneNumberController.text.toString()}'
  );
}

Future<void> submitOtp(verificationId,smsCode,context)async{
  try{
    PhoneAuthCredential credential= await PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
    FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const Sellerappbarbottombar() ));
    },);
  }catch(ex){
    if (kDebugMode) {
      print(ex);
    }
  }
}
