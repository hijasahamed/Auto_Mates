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
                  color: Colors.blue
                ),
                child: Center(
                  child: MyTextWidget(text: 'Free Plan ₹0', color: Colors.white, size: screenSize.width/25, weight: FontWeight.bold)
                ),
              ),
            ],
          ),
          SizedBox(height: screenSize.height/50,),
          Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  
                },
                borderRadius: BorderRadius.circular(screenSize.width / 25),
                child: Ink(
                  height: screenSize.height / 18,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenSize.width / 25),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: MyTextWidget(text: 'Get Premium with ₹1499 yearly', color: Colors.white, size: screenSize.width / 25, weight: FontWeight.bold),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
    },
  );
}