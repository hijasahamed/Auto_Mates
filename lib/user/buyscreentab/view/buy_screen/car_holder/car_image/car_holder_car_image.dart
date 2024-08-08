import 'package:flutter/material.dart';

class CarHolderCarImage extends StatelessWidget {
  const CarHolderCarImage(
      {super.key, required this.screenSize, required this.data,});
  final Size screenSize;
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      child: FadeInImage(
          fadeInDuration: const Duration(milliseconds: 500),
          height: screenSize.height / 5,
          width: screenSize.width,
          placeholder: const AssetImage(
            'assets/images/image placeholder.jpeg',
          ),
          placeholderFit: BoxFit.cover,
          imageErrorBuilder: (context, error, stackTrace) {
            return SizedBox(
              height: screenSize.height / 5,
          width: screenSize.width,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            );
          },
          image: NetworkImage(data['thumbnail']),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high),
    );
  }
}
