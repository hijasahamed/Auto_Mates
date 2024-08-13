import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class FeaturedCarPriceContainer extends StatelessWidget {
  const FeaturedCarPriceContainer({super.key,required this.screenSize,required this.car});
  final Size screenSize;
  final dynamic car;
  @override
  Widget build(BuildContext context) {
    return Positioned(
    bottom: 1,
    right: 0,
      child: Container(
        height: 30,
        width: screenSize.width/2.14,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: const Color.fromARGB(255, 238, 238, 238)),
        child:  Center(
          child:  MyTextWidget(text: '₹${car['price']}', color: Colors.blueGrey, size: screenSize.width/27, weight: FontWeight.bold),
        ),
      )
    );
  }
}