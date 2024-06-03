import 'package:flutter/material.dart';

class UserInterestedCarHolder extends StatelessWidget {
  const UserInterestedCarHolder(
      {super.key, required this.screenSize, required this.car});
  final Size screenSize;
  final dynamic car;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height / 8,
      width: screenSize.width / 3,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
        child: FadeInImage(
            fadeInDuration: const Duration(milliseconds: 750),
            height: screenSize.height / 5,
            width: screenSize.width,
            placeholder: const AssetImage(
              'assets/images/image placeholder.jpeg',
            ),
            placeholderFit: BoxFit.cover,
            imageErrorBuilder: (context, error, stackTrace) {
              return const CircularProgressIndicator(
                color: Colors.blue,
              );
            },
            image: NetworkImage(car['carImage']),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high),
      ),
    );
  }
}
