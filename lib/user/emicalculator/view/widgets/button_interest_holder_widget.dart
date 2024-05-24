import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class ButtonAndInterestHolderWidget extends StatelessWidget {
  const ButtonAndInterestHolderWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Column(      
      children: [
        SizedBox(height: screenSize.height/100,),
        Container(
          height: screenSize.height/17,
          width: screenSize.width/2,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(30)
          ),
          child: const Center(child: MyTextWidget(text: 'Calculate', color: Colors.white, size: 18, weight: FontWeight.bold)),
        ),
        SizedBox(height: screenSize.height/75,),
        Card(
          elevation: 5,
          child: SizedBox(
            height: screenSize.height/6,
            width: screenSize.width/1.7,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextWidget(text: 'EMI Payable per month', color: Colors.black, size: 20, weight: FontWeight.bold),
                MyTextWidget(text: '₹15,846', color: Colors.red, size: 35, weight: FontWeight.bold),
                MyTextWidget(text: 'for 3 years', color: Colors.black, size: 15, weight: FontWeight.bold),
              ],
            ),
          ),
        )
      ],
    );
  }
}