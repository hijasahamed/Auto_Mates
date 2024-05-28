import 'package:auto_mates/seller/seller_profile_screen/view/widget/seller_properties_tile/tile_widget.dart';
import 'package:flutter/material.dart';

class SellerPropertiesTilesWidget extends StatelessWidget {
  const SellerPropertiesTilesWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
      child: Column(        
        children: [
          TileWidget(screenSize: screenSize, title: 'Sold Cars',),
          SizedBox(height: screenSize.height/120,),
          TileWidget(screenSize: screenSize, title: 'User Interest',isUserInterest: true,),
           SizedBox(height: screenSize.height/120,),
          TileWidget(screenSize: screenSize, title: 'Privacy Policy'),
           SizedBox(height: screenSize.height/120,),
          TileWidget(screenSize: screenSize, title: 'Terms & Conditions'),
           SizedBox(height: screenSize.height/120,),
          TileWidget(screenSize: screenSize, title: 'About'),
        ],
      ),
    );
  }
}