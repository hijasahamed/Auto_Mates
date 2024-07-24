import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class AllTopSellersDetails extends StatelessWidget {
  const AllTopSellersDetails({super.key,required this.screenSize,required this.sellerData});
  final Size screenSize;
  final dynamic sellerData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextWidget(text: sellerData['companyName'], color: Colors.blueGrey, size: screenSize.width/25, weight: FontWeight.bold),
          MyTextWidget(text: 'Location: ${sellerData['location']}', color: Colors.blueGrey, size: screenSize.width/28, weight: FontWeight.bold),
          MyTextWidget(text: 'Mobile: ${sellerData['mobile']}', color: Colors.blueGrey, size: screenSize.width/30, weight: FontWeight.bold)
        ],
      ),
    );
  }
}