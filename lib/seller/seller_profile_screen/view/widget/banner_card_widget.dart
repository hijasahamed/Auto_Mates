import 'package:auto_mates/seller/seller_profile_screen/view/widget/seller_logout_widget.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

class BannerCardWidget extends StatelessWidget {
  const BannerCardWidget({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screenSize.height / 4,
          width: screenSize.width,
          decoration: BoxDecoration(
            image: const DecorationImage(image: AssetImage('assets/images/profile_png.png'),fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10),
          ),
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
                color: Colors.white,
                size: 20,
                weight: FontWeight.bold)),
               
      ],
    );
  }
}
