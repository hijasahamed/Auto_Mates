import 'package:flutter/material.dart';

class PostCarBanner extends StatelessWidget {
  const PostCarBanner({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height / 6.5,
      width: screenSize.width / 1.8,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/post new car.jpg'),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high)),
    );
  }
}
