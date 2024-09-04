// ignore_for_file: use_build_context_synchronously

import 'package:auto_mates/seller/authentications/controllers/functions.dart';
import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:auto_mates/seller/authentications/view/widgets/otp_verification_widgets/submit_otp_widget.dart';
import 'package:auto_mates/seller/authentications/view/widgets/otp_verification_widgets/otp_screen_welcome_widget.dart';
import 'package:auto_mates/seller/authentications/view/widgets/otp_verification_widgets/resend_otp_widget.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    final SellerAuthenticationBloc verifyOtpBlocInstance =
        SellerAuthenticationBloc();
    return BlocConsumer<SellerAuthenticationBloc, SellerAuthenticationState>(
      bloc: sellerAuthenticationBloc,
      listener: (context, state)async {
        if (state is SubmitOtpButtonClickedActionState) {
          submitOtp(verificationId, state.code, context, verifyOtpBlocInstance);
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
