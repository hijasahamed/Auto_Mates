import 'package:auto_mates/commonwidgets/my_text_widget.dart';
import 'package:auto_mates/splashscreen/controllers/functions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    checkIfUserLogedin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // body: Container(
      //   width: double.maxFinite,
      //   height: double.maxFinite,
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(image: AssetImage('assets/images/Splash Screen.png'),fit: BoxFit.cover)
      //   ),
      //   child: const MyTextWidget(text: 'Auto Mates', color: Colors.black, size: 40, weight: FontWeight.bold),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset('assets/animations/Animation - 1715086665819.json',height: 500,width: double.maxFinite,),
          const MyTextWidget(text: 'Auto Mates', color: Colors.black, size: 40, weight: FontWeight.bold),
        ],
      ),
    );
  }
}
