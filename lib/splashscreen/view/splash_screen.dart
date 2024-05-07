import 'package:animated_text_kit/animated_text_kit.dart';
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
  Widget build(BuildContext context){
    final size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFDBEDF5), 
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset('assets/animations/splash_animation_jeep.json',), 
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Auto Mates',
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(milliseconds: 220),
                  cursor: ''
                ),
              ],
              isRepeatingAnimation: false,
              repeatForever: false,              
            ),
          ],
        ),
      ),
    );
  }
}
