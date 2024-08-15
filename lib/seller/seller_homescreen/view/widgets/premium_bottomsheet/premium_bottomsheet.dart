// ignore_for_file: use_build_context_synchronously

import 'package:auto_mates/seller/seller_homescreen/controller/payments_services.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/single_car_details/feature_the_car/payment_success_page/payment_success_page.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

showBottomSheetForPremium({context,screenSize}){
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
      padding: EdgeInsets.all(screenSize.width/30),
      decoration: BoxDecoration(  
        color: const Color.fromARGB(255, 240, 240, 240),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(screenSize.width/7),
          topRight: Radius.circular(screenSize.width/7), 
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextWidget(text: 'Upgrade To Premium', color: Colors.blueGrey, size: screenSize.width/17, weight: FontWeight.bold),
              SizedBox(height: screenSize.width/50,),
              Icon(Icons.star,color: const Color.fromARGB(255, 230, 207, 6),size: screenSize.width/12,),
            ],
          ),
          SizedBox(height: screenSize.height/90,),
          MyTextWidget(text: 'Upgrade to a new plan to enjoy more benefits', color: Colors.grey, size: screenSize.width/30, weight: FontWeight.bold),
          SizedBox(height: screenSize.height/50,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.sell,size: screenSize.width/25,color: Colors.grey,),
                  MyTextWidget(text: 'Unlimited car posting', color: Colors.grey, size: screenSize.width/30, weight: FontWeight.bold)
                ],
              ),
              SizedBox(height: screenSize.height/50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.ads_click,size: screenSize.width/25,color: Colors.grey,),
                  MyTextWidget(text: 'Feature your cars', color: Colors.grey, size: screenSize.width/30, weight: FontWeight.bold)
                ],
              ),
            ],
          ),
          SizedBox(height: screenSize.height/50,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextWidget(text: 'Current Plan', color: Colors.blueGrey, size: screenSize.width/35, weight: FontWeight.bold),
              Container(
                height: screenSize.height/18,
                width: screenSize.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenSize.width/25),
                  color: Colors.red
                ),
                child: Center(
                  child: MyTextWidget(text: 'Free Plan ₹0', color: Colors.white, size: screenSize.width/25, weight: FontWeight.bold)
                ),
              ),
            ],
          ),
          SizedBox(height: screenSize.height/50,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextWidget(text: 'Unlock Exciting Features', color: Colors.blueGrey, size: screenSize.width/35, weight: FontWeight.bold),
              Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: ()async {                      
                      dynamic pay = await StripePaymentService.instance
                      .makePayment(amountToPay: 3999)
                      .then((value) => value == true ? true : false);
                      pay==true
                      ? {
                        paymentSuccessPage(context: context,paidAmount: 3999,screenSize: screenSize,title: 'Subscription Plan Activated'),
                        await Future.delayed(const Duration(seconds: 3)),
                        Navigator.of(context).pop(),
                        Navigator.of(context).pop()
                      }
                      :{
                        
                      };
                    },
                    borderRadius: BorderRadius.circular(screenSize.width / 25),
                    child: Ink(
                      height: screenSize.height / 18,
                      width: screenSize.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenSize.width / 25),
                        color: Colors.green,
                      ),
                      child: Center(
                        child: MyTextWidget(text: 'Get Premium with ₹3999 per year', color: Colors.white, size: screenSize.width / 25, weight: FontWeight.bold),
                      ),
                    ),
                  ),
              ),
            ],
          ),
          SizedBox(height: screenSize.height/50,)
        ],
      ),
    );
    },
  );
}