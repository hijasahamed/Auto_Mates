import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/on_tap_car_more_details.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/seller_details/seller_details_widget.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
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
        child: NormalAppBar(title: '${sellerData['sellerName']}'),
      ),
      body: FutureBuilder(
        future: getFavouriteSellersAllCars(sellerId: sellerData['sellerId']),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SkelotonIndicatorList(
                itemCount: 7,
                screenSize: screenSize,
              ),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Center(child: Text('Error: ${snapshot.error}')),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: NoDataErrorPlaceholder(
                screenSize: screenSize,
                titleText: 'No cars from this seller',
              ),
            );
          } else {
            List<DocumentSnapshot> cars = snapshot.data!;
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SellerDetailsCardWidget(
                    screenSize: screenSize,
                    sellerData: sellerData,
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    minHeight: screenSize.height/20,
                    maxHeight: screenSize.height/20,
                    child: Container(
                      color: Colors.white,
                      child: Center(
                        child: MyTextWidget(
                          text: 'More Cars From ${sellerData['sellerName']}',
                          color: Colors.blueGrey,
                          size: screenSize.width / 25,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      var car = cars[index].data() as Map<String, dynamic>;
                      String carId = cars[index].id;
                      car['id'] = carId;
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return OnTapCarMoreDetailsCarScreen(
                                screenSize: screenSize,
                                data: car,
                                isFromSearch: true,
                              );
                            },
                          ));
                        },
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FavouriteSellerMoreCarImage(
                                  screenSize: screenSize, car: car),
                              FavouriteSellerMoreCarDetails(
                                  car: car, screenSize: screenSize),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: cars.length,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
