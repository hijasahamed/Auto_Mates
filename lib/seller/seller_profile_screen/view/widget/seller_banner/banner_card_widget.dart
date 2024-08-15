import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/seller_banner/seller_details/seller_details.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/seller_banner/seller_profile/seller_profile.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class BannerCardWidget extends StatelessWidget {
  const BannerCardWidget({super.key, required this.screenSize,required this.data});
  final Size screenSize;
  final SellerData data;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.blueGrey,
      color: const Color.fromARGB(255, 235, 235, 235),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.05),
          borderRadius: BorderRadius.circular(10),          
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyTextWidget(text: 'My Profile', color: const Color.fromARGB(255, 96, 96, 96), size: screenSize.width/25, weight: FontWeight.w500),            
                  SellerProfileWidget(screenSize: screenSize, data: data),
                ],
              ),
              SizedBox(width: screenSize.width/50,),
              SellerDetails(screenSize: screenSize, data: data)
            ],
          ),
        ),
      ),
    );
  }
}
