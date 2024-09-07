import 'package:auto_mates/seller/authentications/controllers/functions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class OtpScreenWelcomeWidget extends StatelessWidget {
  const OtpScreenWelcomeWidget({super.key,required this.screenSize});
 final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: screenSize.height/4.5,
          width: screenSize.width/1.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: const DecorationImage(image: AssetImage('assets/images/otp log.png'),fit: BoxFit.cover)
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: MyTextWidget(text: 'OTP Verification', color: Colors.black, size: 30, weight: FontWeight.bold),
        ),
        MyTextWidget(text: otpWarn, color: const Color(0XFFB5B5B5), size: 15, weight: FontWeight.bold,maxline: true,alignTextCenter: true,),
        
      ],
    );
  }
}