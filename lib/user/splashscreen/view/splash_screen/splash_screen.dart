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
    return Scaffold(
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: screenSize.height/7,
              width: screenSize.width/3,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/ic_launcher.png',),fit: BoxFit.cover)
              ),
            ),
            MyTextWidget(text: 'Auto Mates', color: Colors.blueGrey, size: screenSize.width/20, weight: FontWeight.bold)
          ],
        ),
      ),
    );
  }
}