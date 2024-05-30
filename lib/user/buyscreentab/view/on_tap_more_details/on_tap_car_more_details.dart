
import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/bottom_app_bar/chat_button.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/bottom_app_bar/interested_button.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/car_details/car_details_widget.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/seller_details/seller_details_widget.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class OnTapCarMoreDetailsCarScreen extends StatelessWidget {
  const OnTapCarMoreDetailsCarScreen(
      {super.key, required this.screenSize, required this.data});
  final Size screenSize;
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: NormalAppBar(title: 'More Details',)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [                         
              SellerDetailsCardWidget(screenSize: screenSize,data: data,),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: MyTextWidget(text: 'Car Details', color: Color(0xFF424141), size: 18, weight: FontWeight.bold),
              ),
              CarDetailsWidget(screenSize: screenSize, data: data,fromSeller: false,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ChatButton(screenSize: screenSize,data: data,),
            InterestedButton(data: data, screenSize: screenSize),
          ],
        ),
      ),
    );
  }
}