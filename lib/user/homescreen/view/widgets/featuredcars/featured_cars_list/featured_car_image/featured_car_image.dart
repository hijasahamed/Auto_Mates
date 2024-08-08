import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FeaturedCarImage extends StatelessWidget {
  const FeaturedCarImage({super.key, required this.screenSize, required this.car});
  final Size screenSize;
  final dynamic car;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
        height: screenSize.height / 6,
        width: screenSize.width / 2.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: CachedNetworkImage(
          imageUrl: car['thumbnail'],
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          placeholder: (context, url) => Container(
            height: screenSize.height / 6,
            width: screenSize.width / 2.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[200],
            ),
            child: const Center(
              child: CircularProgressIndicator(color: Colors.blue,),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            height: screenSize.height / 6,
            width: screenSize.width / 2.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[200],
            ),
            child: const Center(
              child: Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}