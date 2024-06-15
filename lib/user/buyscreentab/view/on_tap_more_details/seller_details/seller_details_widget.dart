
import 'package:auto_mates/seller/authentications/model/model.dart';
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
    return FutureBuilder(       
      future: getSellerDetailsById(data['sellerId']), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: screenSize.height/5.8,
              width: screenSize.width,
              child: SkelotonIndicatorList(screenSize: screenSize,itemCount: 1,)
            ); 
          } else if (snapshot.hasError) {
            return const Center(child: MyTextWidget(text: 'Something went wrong', color: Colors.black, size: 11, weight: FontWeight.bold));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: MyTextWidget(text: 'No seller data', color: Colors.black, size: 11, weight: FontWeight.bold));
          }else{
            SellerData data=snapshot.data!;
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 245, 245, 245)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [                    
                    const Row(
                      children: [
                        MyTextWidget(text: 'Seller informations', color: Color(0xFF424141), size: 15, weight: FontWeight.bold),                     
                        Spacer(),
                        SellerFavButton()
                      ],
                    ),
                    SizedBox(height: screenSize.height/175,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SellersDetail(icon: Icons.person, data: data.companyName,screenSize: screenSize,),                              
                            SellersDetail(icon: Icons.call, data: data.mobile,screenSize: screenSize,),
                            SellersDetail(icon: Icons.star, data: "4.2",screenSize: screenSize,),
                            SellersDetail(icon: Icons.place, data: data.location,screenSize: screenSize,),
                            TextButton(
                              onPressed: 
                              () {
                                sellerDetailsAlertDialog(context: context,data: data);
                              }, 
                              child: Row(
                                children: [
                                  const Icon(Icons.call,color: Colors.blue,size: 15,),
                                  SizedBox(width: screenSize.width/75,),
                                  const MyTextWidget(text: 'Contact Seller', color: Colors.blue, size: 12, weight: FontWeight.bold),
                                ],
                              )
                            ),
                          ],
                        ),
                        MapHolder(screenSize: screenSize)
                      ],
                    ),
                  ],
                ),
              ),
            );
        }
      },
    );
  }
}