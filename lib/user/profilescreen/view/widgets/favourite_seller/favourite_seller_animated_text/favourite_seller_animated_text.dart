// ignore_for_file: library_private_types_in_public_api

import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class FavouriteSellerAnimatedText extends StatefulWidget {
  const FavouriteSellerAnimatedText({super.key});

  @override
  _FavouriteSellerAnimatedTextState createState() => _FavouriteSellerAnimatedTextState();
}

class _FavouriteSellerAnimatedTextState extends State<FavouriteSellerAnimatedText> with SingleTickerProviderStateMixin {
 
  late AnimationController controller;
  late Animation<Color?> colorAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    colorAnimation = ColorTween(
      begin: Colors.white,
      end: const Color.fromARGB(255, 95, 219, 118),
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 78, 124, 162),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: AnimatedBuilder(
          animation: colorAnimation,
          builder: (context, child) {
            return MyTextWidget(
              text: 'Tap to see More cars from this seller',
              color: colorAnimation.value ?? Colors.white,
              size: 13,
              weight: FontWeight.bold,
              maxline: true,
              alignTextCenter: true,
            );
          },
        ),
      ),
    );
  }
}
