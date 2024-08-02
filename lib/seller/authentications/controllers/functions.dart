import 'dart:io';

import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:auto_mates/seller/authentications/view/otp_verification_screen.dart';
import 'package:auto_mates/user/commonwidgets/map_screen/map_screen.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
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
    await sharedPref.setString('sellerProfile', existingSeller.sellerProfile);
    await sharedPref.setString('sellerId', existingSeller.id);
    await sharedPref.setString('sellerCompanyName', existingSeller.companyName);
    await sharedPref.setString('sellerLocation', existingSeller.location);
    await sharedPref.setString('sellerMobile', existingSeller.mobile);
  } else if (existingSeller == null) {
    sellerAuthenticationBloc.add(GetOtpClickedStopLoadingEvent());
    snackbarWidget('Seller not registerd. Create an account', context,
        Colors.red, Colors.white, SnackBarBehavior.floating);
  }
}

Future<void> getOtpButtonClicked(
    {required GlobalKey<FormState> formkey,
    phoneNumber,
    context,
    screenSize,
    sellerAuthenticationBloc,
    contryCode}) async {
  try {
    await FirebaseAuth.instance
        .verifyPhoneNumber(
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
            phoneNumber: '${contryCode + phoneNumber.toString()}')
        .catchError((e) {
      sellerAuthenticationBloc.add(GetOtpClickedStopLoadingEvent());
      snackbarWidget('OTP not deliverd. Somthing issue', context, Colors.red,
          Colors.white, SnackBarBehavior.floating);
    });
  } catch (e) {
    sellerAuthenticationBloc.add(GetOtpClickedStopLoadingEvent());
  }
}

Future<void> submitOtp(
    verificationId, smsCode, context, verifyOtpBlocInstance) async {
  try {
    verifyOtpBlocInstance.add(SubmitOtpClickedLoadingEvent());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    FirebaseAuth.instance.signInWithCredential(credential).then(
      (value) async {
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setBool(sellerLogedInKey, true);
        verifyOtpBlocInstance.add(SubmitOtpClickedStopLoadingEvent());
        verifyOtpBlocInstance.add(SubmitOtpButtonClickedSuccessEvent());
      },
    ).catchError((e) {
      verifyOtpBlocInstance.add(SubmitOtpClickedStopLoadingEvent());
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
    sellerAuthenticationBloc,
    createCompanyBlocInstance}) async {
  if (sellerSignupFormkey.currentState!.validate() &&
      sellerProfileImage != null) {
    if (phoneNumber.length == 10) {
      try {
        SellerData? existingSeller =
            await checkIfSellerAccountAvailable(mobileNumber: phoneNumber);
        if (existingSeller != null) {
          createCompanyBlocInstance.add(CreateCompanyButtonStopLoadingEvent());
          snackbarWidget(
              'This phone number is already registerd with AutoMates.Please try agian with another',
              context,
              Colors.red,
              Colors.white,
              SnackBarBehavior.floating);
        } else {
          await getOtpButtonClicked(
            formkey: sellerSignupFormkey,
            context: context,
            contryCode: countrryCode,
            phoneNumber: phoneNumber,
            screenSize: screenSize,
            sellerAuthenticationBloc: sellerAuthenticationBloc,
          );
          await addSellerDetailsToDb(
              companyName: companyName,
              location: location,
              phoneNumber: phoneNumber);
          SellerData? sellerData =
              await checkIfSellerAccountAvailable(mobileNumber: phoneNumber);
          final sharedPref = await SharedPreferences.getInstance();
          sharedPref.setBool(sellerLogedInKey, true);
          await sharedPref.setString(
              'sellerProfile', sellerData!.sellerProfile);
          await sharedPref.setString('sellerId', sellerData.id);
          await sharedPref.setString(
              'sellerCompanyName', sellerData.companyName);
          await sharedPref.setString('sellerLocation', sellerData.location);
          await sharedPref.setString('sellerMobile', sellerData.mobile);
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    } else {
      createCompanyBlocInstance.add(CreateCompanyButtonStopLoadingEvent());
      snackbarWidget('Phone Number not valid ', context, Colors.red,
          Colors.white, SnackBarBehavior.floating);
    }
  } else {
    createCompanyBlocInstance.add(CreateCompanyButtonStopLoadingEvent());
    snackbarWidget('Please Provide All Details', context, Colors.red,
        Colors.white, SnackBarBehavior.floating);
  }
}

String? sellerProfileImage;

addSellerProfileImage({bloc}) async {
  final file = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (file == null) {
    return;
  }
  sellerProfileImage = file.path;
  bloc.add(SellerProfileImageRefreshEvent());
}

Future<String?> addSellerProfileToDb() async {
  if (sellerProfileImage == null) {
    return null;
  }

  String fileName = DateTime.now().microsecondsSinceEpoch.toString();
  Reference referenceRoot = FirebaseStorage.instance.ref();
  Reference referenceDireImages = referenceRoot.child('images');
  Reference referenceImageToUpload = referenceDireImages.child(fileName);

  try {
    await referenceImageToUpload.putFile(File(sellerProfileImage!));
    String imageUrl = await referenceImageToUpload.getDownloadURL();
    sellerProfileImage == null;
    return imageUrl;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return null;
  }
}

addSellerDetailsToDb({companyName, location, phoneNumber}) async {
  final CollectionReference sellerSignupFirebaseObject =
      FirebaseFirestore.instance.collection('sellerSignupData');
  String? imageUrl = await addSellerProfileToDb();
  final data = {
    'mapLocation': locationLatLon,
    'sellerProfile': imageUrl,
    'companyName': companyName,
    'location': location,
    'mobile': phoneNumber,
    'rating': [],
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
          sellerProfile: doc['sellerProfile'],
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


// fetching location part logics

dynamic locationLatLon;
dynamic address;


void checkLocationPermission({context,locationController}) async {
  PermissionStatus locationStatus = await Permission.location.request();
  if (locationStatus.isGranted) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MapScreen(locationController: locationController,);
    },));
  } else if (locationStatus.isDenied) {
  } else if (locationStatus.isPermanentlyDenied) {
    openAppSettings();
  }
}