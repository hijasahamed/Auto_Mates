import 'package:flutter/material.dart';

class FavouriteSellerMoreCarImage extends StatelessWidget {
  const FavouriteSellerMoreCarImage(
      {super.key, required this.screenSize, required this.car});
  final Size screenSize;
  final dynamic car;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height / 4,
      width: screenSize.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        child: FadeInImage(
            fadeInDuration: const Duration(milliseconds: 500),
            height: screenSize.height / 5,
            placeholder: const AssetImage(
              'assets/images/image placeholder.jpeg',
            ),
            placeholderFit: BoxFit.cover,
            imageErrorBuilder: (context, error, stackTrace) {
              return const CircularProgressIndicator(
                color: Colors.blue,
              );
            },
            image: NetworkImage(car['thumbnail']),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high),
      ),
    );
  }
}
