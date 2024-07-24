import 'package:auto_mates/user/homescreen/view/widgets/topsellers/all_top_sellers/all_top_sellers_list_holder/all_top_sellers_details/all_top_sellers_details.dart';
import 'package:auto_mates/user/homescreen/view/widgets/topsellers/all_top_sellers/all_top_sellers_list_holder/all_topsellers_profile_rating_holder_stack/all_topsellers_profile_rating_holder_stack.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/favourite_seller/favourite_seller_more_cars/favourite_seller_more_cars.dart';
import 'package:flutter/material.dart';

class AllTopSellersListHolder extends StatelessWidget {
  const AllTopSellersListHolder({super.key,required this.sellers,required this.screenSize});
  final dynamic sellers;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: sellers.length,
        gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .90,
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          final seller = sellers[index];
          final sellerData = seller['data'];
          sellerData['id'] = seller['id'];
          final rating = seller['sumRating'];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FavouriteSellerMoreCars(sellerData: sellerData,screenSize: screenSize,isfromTopSellers: true,)
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: .2,color: const Color.fromARGB(255, 98, 98, 98)),
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 252, 252, 252)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AllTopsellersProfileRatingHolderStack(rating: rating, screenSize: screenSize, sellerData: sellerData),
                  AllTopSellersDetails(screenSize: screenSize, sellerData: sellerData)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}