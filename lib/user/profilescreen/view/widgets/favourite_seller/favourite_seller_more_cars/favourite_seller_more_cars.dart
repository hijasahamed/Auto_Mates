import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/commonwidgets/no_data_error_placeholder/no_data_error_placeholder.dart';
import 'package:auto_mates/user/commonwidgets/shimmer_effect/shimmer_effect.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/favourite_seller/favourite_seller_more_cars/fav_seller_more_car_details/favourite_seller_more_car_details.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/favourite_seller/favourite_seller_more_cars/favourite_seller_more_car_image/favourite_seller_more_car_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavouriteSellerMoreCars extends StatelessWidget {
  const FavouriteSellerMoreCars(
      {super.key, required this.sellerData, required this.screenSize});
  final dynamic sellerData;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: NormalAppBar(title: 'More from ${sellerData['sellerName']}')),
      body: FutureBuilder(
        future: getFavouriteSellersAllCars(sellerId: sellerData['sellerId']),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
                backgroundColor: Colors.white,
                body: SkelotonIndicatorGrid(
                  screenSize: screenSize,
                ));
          } else if (snapshot.hasError) {
            return Scaffold(
              backgroundColor: Colors.white,
                body: Center(child: Text('Error: ${snapshot.error}')));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: NoDataErrorPlaceholder(
                  screenSize: screenSize,
                  titleText: 'No cars from this seller'),
            );
          } else {
            List<DocumentSnapshot> cars = snapshot.data!;
            return ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                var car = cars[index].data() as Map<String, dynamic>;
                return GestureDetector(
                  onTap: () {
                    
                  },
                  child: Card(
                    color: Colors.white,
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [                      
                        FavouriteSellerMoreCarImage(screenSize: screenSize, car: car),
                        FavouriteSellerMoreCarDetails(car: car, screenSize: screenSize),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
