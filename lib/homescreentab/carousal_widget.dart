import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Stack(
          children:[
            Container(
            height: screenSize.height/4.8,
            width: screenSize.width,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(width: .5,color: Colors.black),
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
                height: 30,
                width: 75,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.blue),
                child: const Center(child: Text('Promoted',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),))
              ),
            ),
          ]
        ),
        Container(
            height: screenSize.height/4.8,
            width: screenSize.width,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(width: .5,color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://img2.wallspic.com/previews/2/0/7/7/3/137702/137702-executive_car-personal_luxury_car-mid_size_car-alpina-sedan-550x310.jpg')
              )
            ),
            child: const Column(
              children: [
                Text('Buy IT',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                Text('Sell IT',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)
              ],
            ),
         ),
         Container(
            height: screenSize.height/4.8,
            width: screenSize.width,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(width: .5,color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://stimg.cardekho.com/images/carexteriorimages/930x620/Skoda/Slavia/9807/1691643999681/exterior-image-164.jpg')
              )
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Online Platform',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                Text('For Best PreUsed cars',style: TextStyle(fontSize: 22,color: Color.fromRGBO(255, 255, 255, 1),fontWeight: FontWeight.bold),),
                Text('Over #1 million+ Users',style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 10, 226, 237),fontWeight: FontWeight.bold,backgroundColor: Colors.black38),),   
              ],
            ),
         ),
      ], 
      options: CarouselOptions(
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