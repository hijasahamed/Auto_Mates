// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:auto_mates/seller/authentications/controllers/functions.dart';
import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:auto_mates/seller/authentications/view/widgets/otp_verification_widgets/submit_otp_widget.dart';
import 'package:auto_mates/seller/authentications/view/widgets/otp_verification_widgets/otp_screen_welcome_widget.dart';
import 'package:auto_mates/seller/authentications/view/widgets/otp_verification_widgets/resend_otp_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen(
      {super.key,
      required this.screenSize,
      required this.verificationId,
      required this.sellerAuthenticationBloc,
      required this.phoneNumber});
  final Size screenSize;
  final String verificationId;
  final SellerAuthenticationBloc sellerAuthenticationBloc;
  final String phoneNumber;

  int generateOtp() {
    return Random().nextInt(900000) + 100000;
  }

  Future<void> showOtpDialog(BuildContext context, int otpCode) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your OTP Code'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Your OTP code is: $otpCode'),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: otpCode.toString()));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('OTP copied to clipboard'),
                      duration: Duration(seconds: 2),
                    ));
                  },
                  icon: const Icon(Icons.copy),
                  label: const Text('Copy OTP'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final SellerAuthenticationBloc verifyOtpBlocInstance = SellerAuthenticationBloc();
    final int otpCode = generateOtp();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showOtpDialog(context, otpCode);
    }); 
    return BlocConsumer<SellerAuthenticationBloc, SellerAuthenticationState>(
      bloc: sellerAuthenticationBloc,
      listener: (context, state) {
        if (state is SubmitOtpButtonClickedActionState) {
          submitOtp(verificationId, state.code, context, verifyOtpBlocInstance,phoneNumber,otpCode);
        }
        if (state is ResendOtpButtonClickedAction) {
          resendOtp(phoneNumber);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color.fromARGB(255, 255, 254, 254),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: screenSize.height,
                width: screenSize.width,
                child: Column(
                  children: [
                    OtpScreenWelcomeWidget(
                      screenSize: screenSize,
                    ),
                    SubmitOtpWidget(
                      screenSize: screenSize,
                      verifyOtpBlocInstance: verifyOtpBlocInstance,
                      sellerAuthenticationBloc: sellerAuthenticationBloc,
                      phoneNumber: phoneNumber,
                    ),
                    ResendOtpWidget(
                      phoneNumber: phoneNumber,
                      sellerAuthenticationBloc: sellerAuthenticationBloc,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}