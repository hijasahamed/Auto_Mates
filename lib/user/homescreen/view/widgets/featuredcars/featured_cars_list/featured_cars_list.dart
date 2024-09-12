import 'package:auto_mates/user/buyscreentab/view/buy_screen/on_tap_more_details/on_tap_car_more_details.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/homescreen/view/widgets/featuredcars/featured_cars_list/featured_car_image/featured_car_image.dart';
import 'package:auto_mates/user/homescreen/view/widgets/featuredcars/featured_cars_list/featured_car_name_container/featured_car_name_container.dart';
import 'package:auto_mates/user/homescreen/view/widgets/featuredcars/featured_cars_list/featured_car_price_container/featured_car_price_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeaturedCarsList extends StatelessWidget {
  const FeaturedCarsList({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height/5.5,
      width: screenSize.width,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('featuredCars').snapshots(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.blue,));
          }
          if (snapshot.hasError) {
            return Center(child: MyTextWidget(text: 'No Featured Cars', color: Colors.grey, size: screenSize.width/30, weight: FontWeight.bold) );
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: MyTextWidget(text: 'No Featured Cars', color: Colors.grey, size: screenSize.width/30, weight: FontWeight.bold) );
          }
          var featuredCars = snapshot.data!.docs;
          return SizedBox(
            height: screenSize.height/5.5,
            width: screenSize.width,
            child: ListView.builder(
              itemCount: featuredCars.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                dynamic car =featuredCars[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OnTapCarMoreDetailsCarScreen(screenSize: screenSize, data: car)
                    ));
                  },
                  child: Stack(
                    children: [
                      FeaturedCarImage(screenSize: screenSize, car: car),
                      FeaturedCarPriceContainer(screenSize: screenSize, car: car),
                      FeaturedCarNameContainer(screenSize: screenSize, car: car)
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}