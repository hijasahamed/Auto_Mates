import 'package:auto_mates/seller/seller_profile_screen/view/widget/seller_properties_tile/user_interested_notification/user_interested_notify.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/user_interest_page/user_interests_page.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  const TileWidget({super.key, required this.screenSize,required this.title,this.isUserInterest,this.sellerData});
  final Size screenSize;
  final String title;
  final bool? isUserInterest;
  final dynamic sellerData;
  @override
  Widget build(BuildContext context) {
    return Ink(
      height: screenSize.height / 15,
      width: screenSize.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 195, 226, 239)),
      child: InkWell(
        onTap: () {
          if(isUserInterest==true){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UserInterestsPage(screenSize: screenSize,sellerData: sellerData,);
            },));
          }                  
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyTextWidget(
                  text: title,
                  color: const Color(0XFF424141),
                  size: 15,
                  weight: FontWeight.bold),
                  const Spacer(),
              (isUserInterest==true)? UserInterestedNotify(sellerData: sellerData):const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
