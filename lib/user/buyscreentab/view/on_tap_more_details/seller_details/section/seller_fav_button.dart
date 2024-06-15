import 'package:flutter/material.dart';

class SellerFavButton extends StatelessWidget {
  const SellerFavButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        
      }, 
      icon: const Icon(Icons.favorite_outline_rounded,color: Colors.grey,size: 25,)
    );
  }
}
