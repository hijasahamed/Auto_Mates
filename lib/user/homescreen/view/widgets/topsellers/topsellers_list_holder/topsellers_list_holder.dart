import 'dart:math';

import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/favourite_seller/favourite_seller_more_cars/favourite_seller_more_cars.dart';
import 'package:flutter/material.dart';

class TopsellersListHolder extends StatelessWidget {
  const TopsellersListHolder({super.key,required this.screenSize,required this.sellers});
  final Size screenSize;
  final dynamic sellers; 
  @override
  Widget build(BuildContext context) {
    int itemCount = min(sellers.length, 5);
    return ListView.builder(
      itemCount: itemCount,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context,index) {
        final seller = sellers[index];
        final sellerData = seller['data'];
        sellerData['id'] = seller['id'];
        final rating = seller['sumRating'];
        return Padding(
          padding: const EdgeInsets.all(2.5),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FavouriteSellerMoreCars(sellerData: sellerData,screenSize: screenSize,isfromTopSellers: true,)
              ));
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: FadeInImage(
                      fadeInDuration: const Duration(milliseconds: 500),
                      width: screenSize.width/2.1,
                      height: screenSize.height,
                      placeholder: const AssetImage(
                        'assets/images/image placeholder.jpeg',
                      ),
                      placeholderFit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return SizedBox(
                          width: screenSize.width/2.1,
                          height: screenSize.height,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          ),
                        );
                      },
                      image: NetworkImage(sellerData['sellerProfile']),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: screenSize.width/2.1,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                      color: Color.fromARGB(255, 238, 238, 238),
                    ),
                    child: Center(child: MyTextWidget(text: sellerData['companyName'], color: Colors.blueGrey, size: screenSize.width/27, weight: FontWeight.bold))
                  ),
                ),
                Positioned(
                  top: screenSize.width/50,
                  left: screenSize.width/50,
                  child: Container(
                    height: screenSize.height/32,
                    width: screenSize.width/8,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1888FE),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star,color: Colors.white,size: screenSize.width/24,),                            
                        MyTextWidget(text: rating.toString(), color: Colors.white, size: screenSize.width/24, weight: FontWeight.bold)
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
        );
      },
    );
  }
}