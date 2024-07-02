import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
            height: screenSize.height/4.8,
            width: screenSize.width,
            decoration: BoxDecoration(
              color: const Color(0xFFDBEDF5),
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://img2.wallspic.com/previews/2/0/7/7/3/137702/137702-executive_car-personal_luxury_car-mid_size_car-alpina-sedan-550x310.jpg')
              )
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextWidget(text: 'AutoMates', color: const Color.fromARGB(255, 10, 226, 237), size: screenSize.width/12, weight: FontWeight.bold),
                  MyTextWidget(text: 'Buy Your Dream Car', color: Colors.white, size: screenSize.width/18, weight: FontWeight.bold),
                  MyTextWidget(text: 'Sell Your Car', color: Colors.white, size: screenSize.width/18, weight: FontWeight.bold),
                ],
              ),
            ),
         ),
         Container(
            height: screenSize.height/4.8,
            width: screenSize.width,
            decoration: BoxDecoration(
              color: const Color(0xFFDBEDF5),
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://stimg.cardekho.com/images/carexteriorimages/930x620/Skoda/Slavia/9807/1691643999681/exterior-image-164.jpg')
              )
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextWidget(text: 'No 1 Online Platform', color: Colors.white, size: screenSize.width/19, weight: FontWeight.bold),
                  MyTextWidget(text: 'For Best PreUsed cars', color: Colors.white, size: screenSize.width/17, weight: FontWeight.bold),
                  MyTextWidget(text: 'With over 1 million + Users', color: const Color.fromARGB(255, 10, 226, 237), size: screenSize.width/15, weight: FontWeight.bold),  
                ],
              ),
            ),
         ),
        Stack(
          children:[
            Container(
            height: screenSize.height/4.8,
            width: screenSize.width,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://www.hyundai.com/content/dam/hyundai/in/en/data/find-a-car/Creta/Highlights/revised/pc_1120x600.jpg')
              )
            ),
           ),
           Positioned(  
            bottom: 5,
            right: 5,         
              child: Container(
                height: 20,
                width: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.green),
                child: const Center(child: Text('Promoted',style: TextStyle(fontSize: 9,color: Colors.white,fontWeight: FontWeight.bold),))
              ),
            ),
          ]
        ),
      ], 
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        height: screenSize.height/4.8,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 900),
          viewportFraction: 1,
      )
    );
  }
}