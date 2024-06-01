import 'package:flutter/material.dart';

class UserInterestedCarHolder extends StatelessWidget {
  const UserInterestedCarHolder(
      {super.key, required this.screenSize, required this.car});
  final Size screenSize;
  final dynamic car;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height / 8,
      width: screenSize.width / 3,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(car['carImag']), fit: BoxFit.cover),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
    );
  }
}
