import 'package:auto_mates/homescreentab/best_sellers_widget.dart';
import 'package:auto_mates/homescreentab/carousal_widget.dart';
import 'package:auto_mates/homescreentab/fetured_cars_widget.dart';
import 'package:auto_mates/homescreentab/home_appbar_widget.dart';
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
      // backgroundColor: const Color(0xFFDBEDF5),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85),
        child:HomeAppBar(screenSize: screenSize)
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: screenSize.height/4.8,
                width: screenSize.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
                child: CarouselSliderWidget(screenSize: screenSize)
              ),
              Container(
                height: screenSize.height/4,
                width: screenSize.width,                          
                child: BestSellersWidget(screenSize: screenSize),
              ),
              Container(
                height: screenSize.height/4,
                width: screenSize.width,                         
                child: FeaturedCarsWidget(screenSize: screenSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
