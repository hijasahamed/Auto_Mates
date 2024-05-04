
import 'package:auto_mates/commonwidgets/my_text_widget.dart';
import 'package:flutter/material.dart';

class EmiAmountSliderHolderWidget extends StatelessWidget {
  const EmiAmountSliderHolderWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 5,left: 10,right: 10,bottom: 15),
            child: Divider(
              thickness: 5,
              color: Colors.green,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  MyTextWidget(text: '₹1,00,00', color: Color.fromARGB(255, 91, 91, 91), size: 12, weight: FontWeight.bold),
                  MyTextWidget(text: 'Min.Loan Amount', color: Color.fromARGB(255, 91, 91, 91), size: 12, weight: FontWeight.bold),
                ],
              ),
              Column(
                children: [
                  MyTextWidget(text: '₹1,00,00', color: Color.fromARGB(255, 91, 91, 91), size: 12, weight: FontWeight.bold),
                  MyTextWidget(text: 'Min.Loan Amount', color: Color.fromARGB(255, 91, 91, 91), size: 12, weight: FontWeight.bold),
                ],
              ),
            ],
          ),
          SizedBox(height: screenSize.height/40,),
          Container(
            height: screenSize.height/15,
            width: screenSize.width/1.5,
            decoration: BoxDecoration(
              border: Border.all(width: 2,color: const Color.fromARGB(255, 141, 140, 140)),
            ),
            child: const Center(child: MyTextWidget(text: '₹3,50,000', color: Colors.black, size: 27, weight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}