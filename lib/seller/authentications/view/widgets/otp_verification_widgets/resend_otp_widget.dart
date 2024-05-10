import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

class ResendOtpWidget extends StatelessWidget {
  const ResendOtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              
            }, 
            child: const MyTextWidget(text: 'Resend OTP', color: Colors.black87, size: 17, weight: FontWeight.w500),
          ),
        ],
      ),
      
    );
  }
}