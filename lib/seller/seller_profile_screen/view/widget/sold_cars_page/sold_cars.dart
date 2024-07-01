import 'package:auto_mates/seller/seller_profile_screen/controllers/functions.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/sold_cars_page/sold_car_holder/sold_car_holder.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/sold_cars_page/sold_cars_bottom_bar/sold_cars_bottom_nav_bar.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/commonwidgets/no_data_error_placeholder/no_data_error_placeholder.dart';
import 'package:auto_mates/user/commonwidgets/shimmer_effect/shimmer_effect.dart';
import 'package:flutter/material.dart';

class SoldCars extends StatelessWidget {
  const SoldCars({super.key,required this.screenSize,required this.sellerData});
  final Size screenSize;
  final dynamic sellerData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50), 
        child: NormalAppBar(title: 'Sold Cars')
      ),
      body: StreamBuilder(
        stream: getSellersSoldCars(sellerData),  
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return SkelotonIndicatorList(screenSize: screenSize,itemCount: 6,);
          }
          if(snapshot.hasData && snapshot.data.docs.isNotEmpty){
            final cars= snapshot.data!.docs;
            return ListView.builder(
                shrinkWrap: true,
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  var car = cars[index]; 
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SoldCarHolder(screenSize: screenSize, car: car)
                  );
                },
            );
          }         
          else{
            return NoDataErrorPlaceholder(screenSize: screenSize, titleText: 'No Cars Sold');
          }
        },
      ),
      bottomNavigationBar: const SoldCarsBottomNavBar()
    );
  }
}