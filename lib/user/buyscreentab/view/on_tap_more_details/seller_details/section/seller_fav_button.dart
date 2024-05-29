import 'package:flutter/material.dart';

class SellerFavButton extends StatelessWidget {
  const SellerFavButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
        top: 5,
        right: 5,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 15,
          child: Icon(
            Icons.favorite_outline_rounded,
            size: 20,
            color: Colors.red,
          ),
        ));
  }
}
