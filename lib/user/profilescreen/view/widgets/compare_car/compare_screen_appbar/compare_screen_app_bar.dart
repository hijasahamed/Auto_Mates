import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:flutter/material.dart';

class CompareScreenAppBar extends StatelessWidget {
  const CompareScreenAppBar({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: MyTextWidget(text: 'Compare Cars', color: Colors.white, size: screenSize.width/22, weight: FontWeight.bold),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
          carForComparing1.clear();
          carForComparing2.clear();
        }, 
        icon: const Icon(Icons.arrow_back_ios_rounded,color: Colors.white,)
      ),
      flexibleSpace: Container(
        height: screenSize.height,
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(65),bottomRight: Radius.circular(0))
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16,right: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyTextWidget(
                    text: 'Compare multiple cars at once to find the best one ',
                    color: Colors.white,
                    maxline: true,
                    size: screenSize.width / 15,
                    weight: FontWeight.bold),
                MyTextWidget(
                    text: 'AUTOMATES bring you a amazing tool Compare cars for comparisons based on prices milage power fuel and more featues',
                    color: Colors.white,
                    maxline: true,
                    size: screenSize.width / 25,
                    weight: FontWeight.w500),
              ],
            ),
          ),
        ),
      ),
    );
  }
}