import 'package:auto_mates/user/profilescreen/view/widgets/favourite_seller/favourite_seller_remove_button/favourite_seller_remove_button.dart';
import 'package:flutter/material.dart';

class FavouriteSellerImageHolder extends StatelessWidget {
  const FavouriteSellerImageHolder(
      {super.key, required this.data, required this.screenSize});
  final dynamic data;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screenSize.height / 8,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              image: DecorationImage(
                  image: NetworkImage(data['sellerProfile']),
                  fit: BoxFit.cover)),
        ),
        Positioned(
            top: 0,
            right: 0,
            child: FavouriteSellerRemoveButton(
                data: data, screenSize: screenSize)),
      ],
    );
  }
}
