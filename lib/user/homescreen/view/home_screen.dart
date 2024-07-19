import 'package:auto_mates/user/homescreen/view/widgets/emicard/emi_card_widget.dart';
import 'package:auto_mates/user/homescreen/view/widgets/favouritecars/favourite_cars_widget.dart';
import 'package:auto_mates/user/homescreen/view/widgets/latestcarupdates/latest_car_updates_widget.dart';
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
      backgroundColor: const Color(0xFFDBEDF5),    
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Container(
                height: screenSize.height/4.8,
                width: screenSize.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: const Color(0xFFDBEDF5),),
                child: CarouselSliderWidget(screenSize: screenSize)
              ),
            ),
            Card(
              elevation: 5,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: SizedBox(
                  height: screenSize.height/4,
                  width: screenSize.width,                          
                  child: TopSellersWidget(screenSize: screenSize),
                ),
              ),
            ),
            Card(
              elevation: 5,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: SizedBox(
                  height: screenSize.height/4,
                  width: screenSize.width,                         
                  child: FeaturedCarsWidget(screenSize: screenSize),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.5),
              child: EmiCardWidget(screenSize: screenSize),
            ),
            FavouriteCarsWidget(screenSize: screenSize),
            Card(
              elevation: 5,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: SizedBox(
                  height: screenSize.height/2.7,
                  width: screenSize.width,
                  child: LatestCarUpdatesWidget(screenSize: screenSize),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
