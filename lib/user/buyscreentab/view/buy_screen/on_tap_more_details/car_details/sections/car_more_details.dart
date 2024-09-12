import 'package:flutter/material.dart';

class CarMoreDetails extends StatelessWidget {
  const CarMoreDetails({
    super.key,
    required this.text,
    required this.screenSize,
    required this.image,
  });
  final String text;
  final Size screenSize;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: screenSize.height / 35,
          width: screenSize.width / 10,
          decoration: BoxDecoration(image: DecorationImage(image: image)),
        ),
        SizedBox(
          height: screenSize.height / 100,
        ),
        Text(
          text,
          style: TextStyle(
              color: const Color.fromARGB(255, 118, 118, 118),
              fontSize: screenSize.width/30,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
