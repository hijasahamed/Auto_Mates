import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:flutter/material.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({super.key,required this.screenSize,required this.sellerHomeScreenBloc});
  final Size screenSize;
  final SellerHomeScreenBloc sellerHomeScreenBloc;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        sellerHomeScreenBloc.add(FloatingButtonClickedEvent());
      },
      child: const CircleAvatar(
        radius: 30,
        backgroundColor: Colors.blue,
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}