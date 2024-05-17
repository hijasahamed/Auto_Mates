import 'package:flutter/material.dart';

class ProfileBanner extends StatelessWidget {
  const ProfileBanner({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      height: screenSize.height/4,
      width: screenSize.width,
      placeholder: const AssetImage('assets/images/post new car.jpg'), 
      image: const AssetImage('assets/images/profile_png.png',),fit: BoxFit.cover,
    );
  }
}