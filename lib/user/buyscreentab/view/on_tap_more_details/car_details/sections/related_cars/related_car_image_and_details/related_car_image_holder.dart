import 'package:flutter/material.dart';

class RelatedCarImageHolder extends StatelessWidget {
  const RelatedCarImageHolder(
      {super.key, required this.carData, required this.screenSize});
  final Size screenSize;
  final dynamic carData;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5), topRight: Radius.circular(5)),
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
          image: NetworkImage(carData['thumbnail']),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high),
    );
  }
}
