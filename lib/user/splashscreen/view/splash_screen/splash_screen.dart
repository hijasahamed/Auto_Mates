import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    checkIfUserLogedin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    final screenSize =MediaQuery.of(context).size;
    // final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenSize.height/6.8,
                width: screenSize.width/3,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/ic_launcher.png',),fit: BoxFit.cover) 
                ),
              ),
              MyTextWidget(text: 'Auto Mates', color: const Color.fromARGB(255, 25, 89, 121), size: screenSize.width/14, weight: FontWeight.bold)
            ],
          ),
        ),
      ),
    );
  }
}