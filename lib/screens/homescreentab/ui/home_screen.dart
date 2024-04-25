import 'package:auto_mates/screens/homescreentab/ui/favourite_cars_widget.dart';
import 'package:auto_mates/screens/homescreentab/ui/latest_car_updates_widget.dart';
import 'package:auto_mates/screens/homescreentab/ui/top_sellers_widget.dart';
import 'package:auto_mates/screens/homescreentab/ui/carousal_widget.dart';
import 'package:auto_mates/screens/homescreentab/ui/fetured_cars_widget.dart';
import 'package:auto_mates/screens/bottomtabswitch_appbar/app_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,     
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: Container(
                  height: screenSize.height/4.8,
                  width: screenSize.width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
                  child: CarouselSliderWidget(screenSize: screenSize)
                ),
              ),
              Card(
                elevation: 5,
                color: const Color(0xFFDBEDF5),
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
                color: const Color(0xFFDBEDF5),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: SizedBox(
                    height: screenSize.height/4,
                    width: screenSize.width,                         
                    child: FeaturedCarsWidget(screenSize: screenSize),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                color: const Color(0xFFDBEDF5),
                child: SizedBox(
                  height: screenSize.height/4,
                  width: screenSize.width,
                  child:  FavouriteCarsWidget(screenSize: screenSize),
                ),
              ),
              Card(
                elevation: 5,
                color: const Color(0xFFDBEDF5),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: SizedBox(
                    height: screenSize.height/2.9,
                    width: screenSize.width,
                    child: LatestCarUpdatesWidget(screenSize: screenSize),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
