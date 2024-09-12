import 'package:auto_mates/user/homescreen/view/widgets/emicard/emi_card_widget.dart';
import 'package:auto_mates/user/homescreen/view/widgets/favouritecars/favourite_cars_widget.dart';
import 'package:auto_mates/user/homescreen/view/widgets/latest_car_news/latest_car_news.dart';
import 'package:auto_mates/user/homescreen/view/widgets/topsellers/top_sellers_widget.dart';
import 'package:auto_mates/user/homescreen/view/widgets/carouselslider/carousal_slider_widget.dart';
import 'package:auto_mates/user/homescreen/view/widgets/featuredcars/fetured_cars_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {   
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 234, 236),    
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSliderWidget(screenSize: screenSize),
            FeaturedCarsWidget(screenSize: screenSize),
            TopSellersWidget(screenSize: screenSize),
            EmiCardWidget(screenSize: screenSize),
            FavouriteCarsWidget(screenSize: screenSize),
            LatestCarNews(screenSize: screenSize),
          ],
        ),
      ),
    );
  }
}