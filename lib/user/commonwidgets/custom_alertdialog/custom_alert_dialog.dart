import 'package:auto_mates/user/commonwidgets/custom_alertdialog/cancel_button/cancel_button.dart';
import 'package:auto_mates/user/commonwidgets/custom_alertdialog/yes_button/yes_button.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      this.isSellerCalling,
      this.sellerData,
      this.isUserLogout,
      this.isUsersInterestRemoving,
      this.userInterestedData,
      this.profileScreenBloc,
      this.removeFavSeller,
      this.favSellerData,
      required this.screenSize});
  final String image;
  final String title;
  final String subtitle;
  final Size screenSize;
  final bool? isSellerCalling;
  final dynamic sellerData;
  final bool? isUserLogout;
  final ProfileScreenBloc? profileScreenBloc;
  final bool? isUsersInterestRemoving;
  final dynamic userInterestedData;
  final bool? removeFavSeller;
  final dynamic favSellerData;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
        width: screenSize.width / 2.5,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [            
            Container(
              width: screenSize.width/4,
              height: screenSize.height/12,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image))
              ), 
            ),
            SizedBox(
              height: screenSize.height / 100,
            ),
            MyTextWidget(
                text: title,
                color: const Color.fromARGB(255, 73, 73, 73),
                size: 18,
                weight: FontWeight.bold),
            MyTextWidget(
                text: subtitle,
                color: const Color.fromARGB(255, 63, 63, 63),
                alignTextCenter: true,
                size: 13,
                maxline: true,
                weight: FontWeight.bold),
            SizedBox(
              height: screenSize.height / 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CancelButton(screenSize: screenSize),
                YesButton(
                  screenSize: screenSize,
                  isSellerCalling: isSellerCalling,
                  sellerData: sellerData,
                  isUserLogout: isUserLogout,
                  profileScreenBloc: profileScreenBloc,
                  isUsersInterestRemoving: isUsersInterestRemoving,
                  userInterestedData: userInterestedData,
                  removeFavSeller: removeFavSeller,
                  favSellerData: favSellerData,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
