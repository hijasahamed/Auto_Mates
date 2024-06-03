import 'package:flutter/material.dart';

class IntrestedCarPhoto extends StatelessWidget {
  const IntrestedCarPhoto(
      {super.key, required this.screenSize, required this.data});
  final Size screenSize;
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
      child: FadeInImage(
          fadeInDuration: const Duration(milliseconds: 800),
          height: screenSize.height / 1,
          width: screenSize.width / 2.8,
          placeholder: const AssetImage(
            'assets/images/image placeholder.jpeg',
          ),
          placeholderFit: BoxFit.cover,
          imageErrorBuilder: (context, error, stackTrace) {
            return const CircularProgressIndicator(
              color: Colors.blue,
            );
          },
          image: NetworkImage(data['carImage']),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high),
    );
  }
}
