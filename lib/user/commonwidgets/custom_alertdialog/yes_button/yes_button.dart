import 'package:auto_mates/seller/seller_profile_screen/controllers/functions.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:flutter/material.dart';

class YesButton extends StatelessWidget {
  const YesButton(
      {super.key,
      required this.screenSize,
      this.isSellerCalling,
      this.isUserLogout,
      this.profileScreenBloc,
      this.isUsersInterestRemoving,
      this.userInterestedData,
      this.sellerData});
  final Size screenSize;
  final bool? isSellerCalling;
  final dynamic sellerData;
  final bool? isUserLogout;
  final ProfileScreenBloc? profileScreenBloc;
  final bool? isUsersInterestRemoving;
  final dynamic userInterestedData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        (isSellerCalling==true)
        ? makeCall(context: context,mobileNumber: sellerData.mobile)
        : (isUserLogout==true)
        ? profileScreenBloc!.add(ConfirmLogoutEvent())
        : (isUsersInterestRemoving==true)
        ? removeUsersInterest(context: context,docId: userInterestedData.id)
        : null;
      },
      child: Container(
        height: screenSize.height / 20,
        width: screenSize.width / 4,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Center(
          child: MyTextWidget(
              text: 'Yes',
              color: Colors.white,
              size: 15,
              weight: FontWeight.w500),
        ),
      ),
    );
  }
}
