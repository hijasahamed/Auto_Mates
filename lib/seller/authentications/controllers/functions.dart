import 'package:auto_mates/seller/seller_appbar_bottombar/view/seller_appbar_bottombar_screen.dart';
import 'package:auto_mates/seller/authentications/view/otp_verification_screen.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

String otpWarn =
    'Please enter the OTP sent to your registered phone number to complete your verification.';

String otpSmsCode = '';
String countrryCode = '+91';

sellerPhoneVerification(
    {required GlobalKey<FormState> formkey,
    phoneNumber,
    context,
    screenSize,
    sellerAuthenticationBloc,
    contryCode}) async {
      SellerData? existingSeller =
          await checkIfSellerAccountAvailable(mobileNumber: phoneNumber);
      if (existingSeller != null) {       
        await getOtpButtonClicked(
            formkey: formkey,
            context: context,
            contryCode: contryCode,
            phoneNumber: phoneNumber,
            screenSize: screenSize,
            sellerAuthenticationBloc: sellerAuthenticationBloc);
        final sharedPref = await SharedPreferences.getInstance();
        sharedPref.setBool(sellerLogedInKey, true);
        await sharedPref.setString('sellerId', existingSeller.id);
        await sharedPref.setString('sellerCompanyName', existingSeller.companyName);
        await sharedPref.setString('sellerLocation', existingSeller.location);
        await sharedPref.setString('sellerMobile', existingSeller.mobile);
      }
      else if(existingSeller == null){
        snackbarWidget(
        'Seller not registerd. Create an account',
        context,
        Colors.blue,
        Colors.white,
        SnackBarBehavior.floating);
      }      
  }

Future<void> getOtpButtonClicked(
    {required GlobalKey<FormState> formkey,
    phoneNumber,
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
                  phoneNumber: phoneNumber,
                )));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      phoneNumber: '${contryCode + phoneNumber.toString()}');
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

createSellerAccount(
    {context,
    companyName,
    location,
    phoneNumber,
    sellerSignupFormkey,
    screenSize,
    sellerAuthenticationBloc}) async {
  if (sellerSignupFormkey.currentState!.validate()) {
    try {
      SellerData? existingSeller =
          await checkIfSellerAccountAvailable(mobileNumber: phoneNumber);
      if (existingSeller != null) {
        snackbarWidget(
            'This phone number is already registerd with AutoMates.Please try agian with another',
            context,
            Colors.blue,
            Colors.white,
            SnackBarBehavior.floating);
      } else {
        addSellerDetailsToDb(
            companyName: companyName,
            location: location,
            phoneNumber: phoneNumber);
        dynamic sellerData =await checkIfSellerAccountAvailable(mobileNumber: phoneNumber);        
        await getOtpButtonClicked(
          formkey: sellerSignupFormkey,
          context: context,
          contryCode: countrryCode,
          phoneNumber: phoneNumber,
          screenSize: screenSize,
          sellerAuthenticationBloc: sellerAuthenticationBloc,
        );
        final sharedPref = await SharedPreferences.getInstance();
        sharedPref.setBool(sellerLogedInKey, true);
        await sharedPref.setString('sellerId', sellerData.id);
        await sharedPref.setString('sellerCompanyName', sellerData.companyName);
        await sharedPref.setString('sellerLocation', sellerData.location);
        await sharedPref.setString('sellerMobile', sellerData.mobile);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

addSellerDetailsToDb({companyName, location, phoneNumber}) {
  final CollectionReference sellerSignupFirebaseObject =
      FirebaseFirestore.instance.collection('sellerSignupData');
  final data = {
    'companyName': companyName,
    'location': location,
    'mobile': phoneNumber,
  };
  sellerSignupFirebaseObject.add(data);
}

checkIfSellerAccountAvailable({mobileNumber}) async {
  final CollectionReference sellerSignupFirebaseObject =
      FirebaseFirestore.instance.collection('sellerSignupData');
  try {
    QuerySnapshot querySnapshot = await sellerSignupFirebaseObject
        .where('mobile', isEqualTo: mobileNumber)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      QueryDocumentSnapshot doc = querySnapshot.docs.first;
      SellerData sellerData = SellerData(
          id: doc.id,
          companyName: doc['companyName'],
          location: doc['location'],
          mobile: doc['mobile']);
      return sellerData;
    } else {
      return null;
    }
  } catch (e) {
    if (kDebugMode) {
      print('error checking seller details: $e');
    }
  }
}

class SellerData {
  final String id;
  final String companyName;
  final String location;
  final String mobile;
  SellerData(
      {required this.id,
      required this.companyName,
      required this.location,
      required this.mobile});
}

Future<void> resendOtp(phoneNumberController) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
      verificationCompleted: (PhoneAuthCredential credential) {
        FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException ex) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
      phoneNumber: countrryCode + phoneNumberController);
}

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
