import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class FavouriteSellerMoreCarsButton extends StatelessWidget {
  const FavouriteSellerMoreCarsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(      
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 53, 103, 145),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
      ),
      child: TextButton(
          onPressed: () {
            
          },
          child: const MyTextWidget(
            text: 'Click to see More cars from this seller',
            color: Colors.white,
            size: 11,
            weight: FontWeight.bold,
            maxline: true,
            alignTextCenter: true,
          )),
    );
  }
}
