import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:flutter/material.dart';

class FavouriteSellerMoreCars extends StatelessWidget {
  const FavouriteSellerMoreCars({super.key,required this.data});
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: PreferredSize(
      preferredSize: const Size.fromHeight(50), 
      child: NormalAppBar(title: 'More from ${data['sellerName']}')
    ),
    );
  }
}