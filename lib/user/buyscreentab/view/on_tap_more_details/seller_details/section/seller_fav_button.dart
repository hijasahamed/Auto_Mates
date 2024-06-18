import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:flutter/material.dart';

class SellerFavButton extends StatelessWidget {
  const SellerFavButton({super.key,required this.sellerData,});
  final SellerData sellerData;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        addSellerToFavourite(context: context,sellerData: sellerData);
      }, 
      icon: const Icon(Icons.favorite_outline_rounded,color: Colors.grey,size: 25,)
    );
  }
}
