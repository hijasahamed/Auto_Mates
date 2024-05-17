import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

class BannerCardWidget extends StatelessWidget {
  const BannerCardWidget({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height / 3.6,
      width: screenSize.width,
      child: Stack(
        children: [
          FadeInImage(
            height: screenSize.height / 4,
            width: screenSize.width,
            placeholder: const AssetImage('assets/images/placeholder.jpg'),
            image: const AssetImage(
              'assets/images/profile_png.png',
            ),
            fit: BoxFit.cover,
          ),
          const Positioned(
              bottom: 30,
              left: 15,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 55,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              )),
          const Positioned(
              bottom: 0,
              left: 15,
              child: MyTextWidget(
                  text: 'Abc Dealers ',
                  color: Colors.blueAccent,
                  size: 20,
                  weight: FontWeight.bold))
        ],
      ),
    );
  }
}