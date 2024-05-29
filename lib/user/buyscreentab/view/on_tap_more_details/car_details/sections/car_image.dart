import 'package:flutter/material.dart';

class CarImage extends StatelessWidget {
  const CarImage(
      {super.key,
      required this.screenSize,
      required this.data,
      this.fromSeller});
  final Size screenSize;
  final dynamic data;
  final bool? fromSeller;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screenSize.height / 4,
          width: screenSize.width,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              image: DecorationImage(
                  image: NetworkImage(data['image']), fit: BoxFit.cover)),
        ),
        (fromSeller == false)
            ? const Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: Icon(
                    Icons.favorite_outline_rounded,
                    size: 20,
                    color: Colors.red,
                  ),
                ))
            : const SizedBox()
      ],
    );
  }
}
