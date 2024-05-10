import 'package:auto_mates/seller/authentications/view/widgets/otp_verification_widgets/enter_otp_widget.dart';
import 'package:auto_mates/seller/authentications/view/widgets/otp_verification_widgets/otp_screen_welcome_widget.dart';
import 'package:auto_mates/seller/authentications/view/widgets/otp_verification_widgets/resend_otp_widget.dart';
import 'package:flutter/material.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key,required this.screenSize});
final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 254),
     body: SingleChildScrollView(
       child: SafeArea(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
             child: Column(
              children: [
                OtpScreenWelcomeWidget(screenSize: screenSize,),
                EnterOtpWidget(screenSize: screenSize,),
                const ResendOtpWidget(),
              ],
             ),
           ),
         ),
       ),
     ),
    );
  }
}