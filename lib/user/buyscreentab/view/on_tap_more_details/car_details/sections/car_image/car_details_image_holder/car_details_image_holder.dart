import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarDetailsImageHolder extends StatelessWidget {
  const CarDetailsImageHolder(
      {super.key,
      required this.screenSize,
      required this.carouselController,
      required this.imageUrls});
  final Size screenSize;
  final CarouselController carouselController;
  final List<String> imageUrls;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: .3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: CarouselSlider.builder(
          carouselController: carouselController,
          itemCount: imageUrls.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            String imageUrl = imageUrls[index];
            return SizedBox(
              width: screenSize.width,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Center(child: Text('No Image'));
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
              ),
            );
          },
          options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            viewportFraction: 1,
            height: screenSize.height / 4,
            autoPlay: true,
            enlargeCenterPage: false,
            enableInfiniteScroll: imageUrls.length > 1,
          ),
        ),
      ),
    );
  }
}
