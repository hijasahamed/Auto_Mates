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
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    colorAnimation = ColorTween(
      begin: const Color.fromARGB(255, 10, 10, 10),
      end: Colors.blue,
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: AnimatedBuilder(
        animation: colorAnimation,
        builder: (context, child) {
          return MyTextWidget(
            text: 'Tap to see More cars from this seller',
            color: colorAnimation.value ?? Colors.white,
            size: 8,
            weight: FontWeight.bold,
            maxline: true,
            alignTextCenter: true,
          );
        },
      ),
    );
  }
}
