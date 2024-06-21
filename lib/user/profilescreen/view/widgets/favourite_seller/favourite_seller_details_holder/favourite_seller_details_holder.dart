import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class FavouriteSellerDetailsHolder extends StatelessWidget {
  const FavouriteSellerDetailsHolder(
      {super.key, required this.data, required this.screenSize});
  final dynamic data;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextWidget(
              text: data['sellerName'],
              color: const Color(0xFF424141),
              size: screenSize.width/30,
              weight: FontWeight.bold),
          MyTextWidget(
              text: data['sellerLocation'],
              color: Colors.black,
              size: screenSize.width/40,
              weight: FontWeight.bold),
          MyTextWidget(
              text: 'Phone:${data['sellerMobile']}',
              color: Colors.black,
              size: screenSize.width/40,
              weight: FontWeight.bold),
        ],
      ),
    );
  }
}
