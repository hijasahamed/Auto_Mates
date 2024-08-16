import 'package:auto_mates/seller/seller_profile_screen/view/widget/seller_properties_tile/user_interested_notification/user_interested_notify.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/sold_cars_page/sold_cars.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/user_interest_page/user_interests_page.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/drawer/about/about_screen.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/drawer/privacy_policy/privacy_policy_screen.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/drawer/terms_condition/terms_conditions_screen.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  const TileWidget({super.key, required this.screenSize,required this.title,this.isUserInterest,this.sellerData,this.soldCars,this.privacyPolicy,this.termsCondition,this.about});
  final Size screenSize;
  final String title;
  final bool? isUserInterest;
  final dynamic sellerData;
  final bool? soldCars;
  final bool? privacyPolicy;
  final bool? termsCondition;
  final bool? about;
  @override
  Widget build(BuildContext context) {
    return Ink(
      height: screenSize.height / 15,
      width: screenSize.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 0.2),
          color: const Color.fromARGB(255, 250, 250, 250)),
      child: InkWell(
        onTap: () {
          if(isUserInterest==true){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UserInterestsPage(screenSize: screenSize,sellerData: sellerData,);
            },));
          }
          else if(soldCars == true){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SoldCars(screenSize: screenSize,sellerData: sellerData,);
            },));
          }
          else if(privacyPolicy == true){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PrivacyPolicyScreen(screenSize: screenSize);
            },));
          }
          else if(termsCondition == true){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TermsConditionsScreen(screenSize: screenSize);
            },));
          }
          else if(about == true){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AboutScreen(screenSize: screenSize);
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
                  color: Colors.blueGrey,
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
