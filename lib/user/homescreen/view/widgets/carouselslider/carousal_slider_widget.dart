import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        height: screenSize.height/4.8,
        width: screenSize.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(width: .2,color: Colors.grey)
        ),
        child: CarouselSlider(
            items: [
              firstBanner(),
              secondBanner(),          
            ],
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              height: screenSize.height / 4.8,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,          
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 900),
              viewportFraction: 1,
            )),
      ),
    );
  }

  Container firstBanner() {
    return Container(
      height: screenSize.height / 4.8,
      width: screenSize.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            FadeInImage(
              fit: BoxFit.cover,
              placeholder: const AssetImage(
                  'assets/images/placeholder.jpg'),
              image: const NetworkImage(
                'https://img2.wallspic.com/previews/2/0/7/7/3/137702/137702-executive_car-personal_luxury_car-mid_size_car-alpina-sedan-550x310.jpg',
              ),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/placeholder.jpg',
                  fit: BoxFit.cover,
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextWidget(
                    text: 'AutoMates',
                    color: Colors.white,
                    size: screenSize.width / 8,
                    weight: FontWeight.bold,
                  ),
                  MyTextWidget(
                    text: 'Buy Your Dream Car',
                    color: const Color.fromARGB(255, 10, 226, 237),
                    size: screenSize.width / 22,
                    weight: FontWeight.bold,
                  ),
                  MyTextWidget(
                    text: 'Sell Your Car',
                    color: const Color.fromARGB(255, 10, 226, 237),
                    size: screenSize.width / 22,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Container secondBanner() {
    return Container(
      height: screenSize.height / 4.8,
      width: screenSize.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            FadeInImage(
              fit: BoxFit.cover,
              placeholder: const AssetImage(
                  'assets/images/placeholder.jpg'),
              image: const NetworkImage(
                'https://img2.wallspic.com/previews/2/0/7/7/3/137702/137702-executive_car-personal_luxury_car-mid_size_car-alpina-sedan-550x310.jpg',
              ),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/placeholder.jpg',
                  fit: BoxFit.cover,
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextWidget(text: 'No 1 Online Platform', color: Colors.white, size: screenSize.width/22, weight: FontWeight.bold),
                  MyTextWidget(text: 'For Best PreUsed cars', color: Colors.white, size: screenSize.width/17, weight: FontWeight.bold),
                  MyTextWidget(text: 'With over 1 million+ Users', color: const Color.fromARGB(255, 10, 226, 237), size: screenSize.width/25, weight: FontWeight.bold),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
