// ignore_for_file: use_build_context_synchronously
import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/premium_bottomsheet/premium_bottomsheet_items/current_plan.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/premium_bottomsheet/premium_bottomsheet_items/premium_features_text.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/premium_bottomsheet/premium_bottomsheet_items/premium_plan_button.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/premium_bottomsheet/premium_bottomsheet_items/sub_text.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/premium_bottomsheet/premium_bottomsheet_items/upgrade_premium_main_text.dart';
import 'package:flutter/material.dart';

showBottomSheetForPremium({context, screenSize,sellerId}) {
  SellerHomeScreenBloc subscriptionBlocInstance = SellerHomeScreenBloc();
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      topRight: Radius.circular(30),
    )),
    context: context,
    builder: (context) {
      return Container(
        width: screenSize.width,
        padding: EdgeInsets.all(screenSize.width / 30),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 240, 240),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(screenSize.width / 7),
            topRight: Radius.circular(screenSize.width / 7),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UpgradePremiumMainText(screenSize: screenSize),
            SizedBox(height: screenSize.height / 90,),
            SubText(screenSize: screenSize),
            SizedBox(height: screenSize.height / 50,),
            PremiumFeaturesText(screenSize: screenSize),
            SizedBox(height: screenSize.height / 50,),
            CurrentPlan(screenSize: screenSize),
            SizedBox(height: screenSize.height / 50,),
            PremiumPlanButton(screenSize: screenSize, subscriptionBlocInstance: subscriptionBlocInstance,sellerId: sellerId,),
            SizedBox(height: screenSize.height / 50,)
          ],
        ),
      );
    },
  );
}