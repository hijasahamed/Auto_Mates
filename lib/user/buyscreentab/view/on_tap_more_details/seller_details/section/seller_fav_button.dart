import 'package:flutter/material.dart';

class SellerFavButton extends StatelessWidget {
  const SellerFavButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 17,
      backgroundColor: Colors.black45,
      child: IconButton(
        onPressed: () {
          
        }, 
        icon: const Icon(Icons.favorite_rounded,color: Colors.white,size: 18,)
      ),
    );
  }
}
