import 'package:auto_mates/seller/authentications/controllers/functions.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/seller_details/section/map_holder.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/seller_details/section/seller_details.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/seller_details/section/seller_fav_button.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/commonwidgets/shimmer_effect/shimmer_effect.dart';
import 'package:flutter/material.dart';

class SellerDetailsCardWidget extends StatelessWidget {
  const SellerDetailsCardWidget({super.key, required this.screenSize,required this.data});
  final Size screenSize;
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: FutureBuilder(       
        future: getSellerDetailsById(data['sellerId']), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
              return const SkelotonIndicator();
            } else if (snapshot.hasError) {
              return const Center(child: MyTextWidget(text: 'Something went wrong', color: Colors.black, size: 11, weight: FontWeight.bold));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: MyTextWidget(text: 'No seller data', color: Colors.black, size: 11, weight: FontWeight.bold));
            }else{
              SellerData data=snapshot.data!;
              return Stack(              
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [                    
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: MyTextWidget(text: 'Seller information', color: Color(0xFF424141), size: 13, weight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SellersDetail(icon: Icons.person, data: data.companyName),
                              SellersDetail(icon: Icons.call, data: data.mobile),
                              const SellersDetail(icon: Icons.star, data: "4.2"),
                              SellersDetail(icon: Icons.place, data: data.location),
                            ],
                          ),
                          MapHolder(screenSize: screenSize)
                        ],
                      ),
                    ],
                  ),
                ),
                const SellerFavButton()
              ],
            );
          }
        },
      ),
    );
  }
}


