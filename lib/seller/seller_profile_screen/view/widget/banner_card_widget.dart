import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class BannerCardWidget extends StatelessWidget {
  const BannerCardWidget({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screenSize.height / 5,
          width: screenSize.width,
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/images/profile_png.png'),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const Positioned(
            top: 2,
            left: 15,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 55,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            )),
        const Positioned(
            top: 115,
            left: 15,
            child: MyTextWidget(
                text: 'Abc Dealers ',
                color: Colors.white,
                size: 20,
                weight: FontWeight.bold)),
        Positioned(
            top: 135,
            left: 3,
            child: TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    const MyTextWidget(
                        text: 'Edit profile',
                        color: Colors.white,
                        size: 15,
                        weight: FontWeight.w500),
                    SizedBox(
                      width: screenSize.width / 75,
                    ),
                    const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 15,
                    )
                  ],
                ))),
      ],
    );
  }
}
