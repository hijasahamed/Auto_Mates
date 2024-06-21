import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/car_details/car_details_widget.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class SingleCarDetailsScreen extends StatelessWidget {
  const SingleCarDetailsScreen({super.key,required this.screenSize,required this.data,required this.sellerHomeScreenBloc});
  final Size screenSize;
  final dynamic data;
  final SellerHomeScreenBloc? sellerHomeScreenBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: NormalAppBar(title: 'Car Details',isFromSeller: true,sellerHomeScreenBloc: sellerHomeScreenBloc,data: data,screenSize: screenSize,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CarDetailsWidget(screenSize: screenSize, data: data,fromSeller: true,),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: screenSize.height/11,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 218, 44, 25)
          ),
          child: InkWell(
            onTap: () {
              
            },
            child: const Center(child: MyTextWidget(text: 'Mark as Sold Cars', color: Colors.white, size: 15, weight: FontWeight.bold))),
        ),
      ),
    );
  }
}