import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FavCarImageHolder extends StatelessWidget {
  const FavCarImageHolder(
      {super.key,
      required this.carouselController,
      required this.cars,
      required this.screenSize});
  final Size screenSize;
  final dynamic cars;
  final CarouselController carouselController;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CarouselSlider.builder(
        carouselController: carouselController,
        itemCount: cars.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          String imageUrl = cars[index]['thumbnail'];
          return SizedBox(
            width: screenSize.width,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Text('No Image');
              },
            ),
          );
        },
        options: CarouselOptions(
          scrollDirection: Axis.horizontal,
          viewportFraction: 1,
          height: screenSize.height / 4.9,
          autoPlay: true,
          enlargeCenterPage: false,
          enableInfiniteScroll: cars.length > 1,
        ),
      ),
    );
  }
}
