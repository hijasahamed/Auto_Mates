import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class SellerDetails extends StatelessWidget {
  const SellerDetails(
      {super.key, required this.screenSize, required this.data});
  final Size screenSize;
  final SellerData data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: screenSize.height / 22,
        ),
        MyTextWidget(
            text: 'Name: ${data.companyName}',
            color: Colors.blueGrey,
            size: screenSize.width / 21,
            maxline: true,
            weight: FontWeight.w700),
        MyTextWidget(
            text: 'Mobile: ${data.mobile}',
            color: Colors.blueGrey,
            size: screenSize.width / 25,
            maxline: true,
            weight: FontWeight.w700),
        MyTextWidget(
            text: 'Place: ${data.location}',
            color: Colors.blueGrey,
            size: screenSize.width / 25,
            maxline: true,
            weight: FontWeight.w700),
      ],
    );
  }
}
