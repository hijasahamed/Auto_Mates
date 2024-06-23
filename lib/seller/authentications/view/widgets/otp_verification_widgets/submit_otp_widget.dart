import 'package:auto_mates/seller/authentications/controllers/functions.dart';
import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:auto_mates/seller/authentications/view/widgets/otp_verification_widgets/otp_submit_button.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class SubmitOtpWidget extends StatelessWidget {
  const SubmitOtpWidget(
      {super.key,
      required this.screenSize,
      required this.verifyOtpBlocInstance,
      required this.phoneNumber,
      required this.sellerAuthenticationBloc});
  final Size screenSize;
  final SellerAuthenticationBloc verifyOtpBlocInstance;
  final SellerAuthenticationBloc sellerAuthenticationBloc;
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyTextWidget(
                  text: 'Enter the OTP sent to',
                  color: Color(0XFFB5B5B5),
                  size: 15,
                  weight: FontWeight.bold),
              SizedBox(
                width: screenSize.width / 60,
              ),
              MyTextWidget(
                  text: phoneNumber,
                  color: Colors.black,
                  size: 18,
                  weight: FontWeight.bold),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Pinput(
              length: 6,
              showCursor: true,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              onChanged: (value) {
                otpSmsCode = value;
              },
            ),
          ),
          SizedBox(
            height: screenSize.height / 40,
          ),
          OtpSubmitButton(
            verifyOtpBlocInstance: verifyOtpBlocInstance,
            sellerAuthenticationBloc: sellerAuthenticationBloc,
          )
        ],
      ),
    );
  }
}
