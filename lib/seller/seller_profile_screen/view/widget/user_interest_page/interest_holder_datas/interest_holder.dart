import 'package:auto_mates/seller/seller_profile_screen/controllers/functions.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/user_interest_page/interest_holder_datas/car_and_user_details/car_and_user_details.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/user_interest_page/interest_holder_datas/car_image/intrested_car_photo.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/user_interest_page/interest_holder_datas/interest_holder_ontap/interest_holder_ontap.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/user_interest_page/interest_holder_datas/user_interest_close_button/user_interest_close_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InterestHolder extends StatelessWidget {
  const InterestHolder(
      {super.key, required this.screenSize, required this.data});
  final Size screenSize;
  final DocumentSnapshot data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height / 6,
      width: screenSize.width,
      child: GestureDetector(
        onTap: () {
          updateTheSellerViewdStatus(docId: data.id);
          InterestHolderOntap().callAndChatCarInterestedCustomer(context: context,data: data,screenSize: screenSize);
        },
        child: Card(
          color: data['sellerViewed'] == 'yes'? const Color.fromARGB(255, 243, 243, 243) : const Color.fromARGB(255, 212, 224, 233),
          elevation: 6,
          child: Row(
            children: [
              IntrestedCarPhoto(screenSize: screenSize, data: data),
              CarAndUserDetails(data: data),
              const Spacer(),
              UserInterestCloseButton(data: data,screenSize: screenSize,)
            ],
          ),
        ),
      ),
    );
  }
}


