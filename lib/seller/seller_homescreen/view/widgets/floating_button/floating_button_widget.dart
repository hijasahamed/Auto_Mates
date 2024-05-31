import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:flutter/material.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget(
      {super.key,
      required this.screenSize,
      required this.sellerHomeScreenBloc});
  final Size screenSize;
  final SellerHomeScreenBloc sellerHomeScreenBloc;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.redAccent,
      onPressed: () {
        sellerHomeScreenBloc.add(FloatingButtonClickedEvent());        
      },
      child: const Icon(Icons.add,color: Colors.white,size: 40,)
    );
  }
}
