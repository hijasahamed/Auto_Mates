import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

class BannerCardWidget extends StatelessWidget {
  const BannerCardWidget({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height/3.6,
      width: screenSize.width,
      child: Stack(
        children: [
          Container(
            height: screenSize.height / 5,
            width: screenSize.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  image: AssetImage('assets/images/profile_png.png'),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high),
            ),
          ),
          const Positioned(
            bottom: 30,
            left: 15,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 55,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            )
          ),
          const Positioned(
            bottom: 0,
            left: 15,
            child: MyTextWidget(text: 'Abc Dealers ', color: Colors.blueAccent, size: 20, weight: FontWeight.bold)
          )
        ],
      ),
    );
  }
}
