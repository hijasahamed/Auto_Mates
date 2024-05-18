import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

class LogoutContainer extends StatelessWidget {
  const LogoutContainer({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height/7, 
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
        image: const DecorationImage(image: AssetImage('assets/images/logout.png'),fit: BoxFit.cover)
      ),
      child: const Positioned(
        bottom: 0,
        child: MyTextWidget(text: "Logout", color: Colors.white, size: 20, weight: FontWeight.bold)
      ),
    );
  }
}