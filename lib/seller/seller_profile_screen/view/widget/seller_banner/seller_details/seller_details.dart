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
        MyTextWidget(
            text: 'Name: ${data.companyName}',
            color: const Color.fromARGB(255, 96, 96, 96),
            size: screenSize.width / 21,
            maxline: true,
            weight: FontWeight.bold),
        MyTextWidget(
            text: 'Mobile: ${data.mobile}',
            color: const Color.fromARGB(255, 96, 96, 96),
            size: screenSize.width / 28,
            maxline: true,
            weight: FontWeight.w600),
        MyTextWidget(
            text: 'Place: ${data.location}',
            color: const Color.fromARGB(255, 96, 96, 96),
            size: screenSize.width / 28,
            maxline: true,
            weight: FontWeight.w600),
      ],
    );
  }
}
