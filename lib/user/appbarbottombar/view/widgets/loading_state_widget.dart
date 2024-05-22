import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({super.key,required this.isAccountCreated,required this.screenSize});
  final bool isAccountCreated;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
     if (isAccountCreated == true) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            body: SizedBox(
              height: screenSize.height,
              width: screenSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: screenSize.height/6,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/account created.webp'))
                    ),
                  ),
                  const MyTextWidget(
                    text: 'Account created successfully',
                    color: Color.fromARGB(255, 52, 52, 52),
                    size: 20,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: const Color(0xFFDBEDF5),
            body: SizedBox(
              height: screenSize.height,
              width: screenSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    'assets/animations/loading_animation.json',
                    height: screenSize.height / 10,
                    width: screenSize.width / 4,
                    repeat: true,
                  ),
                  const MyTextWidget(
                    text: 'Loading',
                    color: Colors.blue,
                    size: 20,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          );
  }
}
}