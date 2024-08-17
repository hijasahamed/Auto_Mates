import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:flutter/material.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget(
      {super.key,
      required this.screenSize,
      required this.data,
      required this.sellerHomeScreenBloc});
  final Size screenSize;
  final SellerHomeScreenBloc sellerHomeScreenBloc;
  final SellerData data;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.redAccent,
      shape: const CircleBorder(),
      onPressed: () {
        checkSellerCarCountExeeded(sellerId: data.id,sellerHomeScreenBloc: sellerHomeScreenBloc,context: context,screenSize: screenSize,sellerData: data); 
      },
      child: const Icon(Icons.add,color: Colors.white,size: 40,)
    );
  }
}