import 'package:auto_mates/seller/authentications/controllers/functions.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class EnterOtpWidget extends StatelessWidget {
  const EnterOtpWidget({super.key, required this.screenSize});
  final Size screenSize;
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
              const MyTextWidget(
                  text: '7907721095',
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
            ),
          ),
          SizedBox(
            height: screenSize.height / 40,
          ),
          ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
                minimumSize: WidgetStatePropertyAll(Size(double.infinity, 55)),
              ),
              onPressed: () {},
              child: const MyTextWidget(
                  text: 'Submit OTP',
                  color: Colors.white,
                  size: 20,
                  weight: FontWeight.bold))
        ],
      ),
    );
  }
}

