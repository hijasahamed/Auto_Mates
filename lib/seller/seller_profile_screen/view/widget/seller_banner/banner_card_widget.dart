import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/bloc/seller_profile_bloc.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/seller_banner/premium_seller_countdown/premium_seller_countdown.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/seller_banner/seller_details/seller_details.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/seller_banner/seller_profile/seller_profile.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class BannerCardWidget extends StatelessWidget {
  const BannerCardWidget({super.key, required this.screenSize,required this.data,required this.sellerProfileBloc});
  final Size screenSize;
  final SellerData data;
  final SellerProfileBloc sellerProfileBloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.2),
        borderRadius: BorderRadius.circular(10),          
      ),
      child: Padding(
        padding: EdgeInsets.all(screenSize.width/100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SellerProfileWidget(screenSize: screenSize, data: data),
                SizedBox(width: screenSize.width/50,),
                SellerDetails(screenSize: screenSize, data: data),
                const Spacer(),
                SellerLogoutPopupMenu(screenSize: screenSize, sellerProfileBloc: sellerProfileBloc),
              ],
            ),
            PremiumSellerCountdown(
              screenSize: screenSize,
              data: data,
            ),
          ],
        ),
      ),
    );
  }
}

class SellerLogoutPopupMenu extends StatelessWidget {
  const SellerLogoutPopupMenu({
    super.key,
    required this.screenSize,
    required this.sellerProfileBloc,
  });

  final Size screenSize;
  final SellerProfileBloc sellerProfileBloc;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.more_vert,
        color: Colors.black,
        size: screenSize.width / 15,
      ),
      onSelected: (String value) {
        if (value == 'Logout') {
          sellerProfileBloc.add(SellerLogoutButtonClickedEvent());
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'Logout',
            child: MyTextWidget(text: 'Logout', color: Colors.red, size: screenSize.width/30, weight: FontWeight.w500),
          ),
        ];
      },
    );
  }
}
