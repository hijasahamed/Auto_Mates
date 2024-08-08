import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class FeaturedCarNameContainer extends StatelessWidget {
  const FeaturedCarNameContainer({super.key,required this.screenSize,required this.car});
  final Size screenSize;
  final dynamic car;
  @override
  Widget build(BuildContext context) {
    return Positioned(    
      bottom: 33,
      left: 7,                  
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.black54,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: screenSize.width/100,right: screenSize.width/100),
          child: Row(
            children: [
              MyTextWidget(text: car['brand'], color: Colors.white, size: screenSize.width/30, weight: FontWeight.bold),
              SizedBox(width: screenSize.width/100,),
              MyTextWidget(text: car['modelName'], color: Colors.white, size: screenSize.width/30, weight: FontWeight.bold),
            ],
          ),
        )
      ),
    );
  }
}