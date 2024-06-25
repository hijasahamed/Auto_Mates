// ignore_for_file: library_private_types_in_public_api

import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatefulWidget {
  const AnimatedTextWidget({super.key,required this.textTitle,required this.beginColor,required this.endColor,required this.textSize});
 final String textTitle;
 final double textSize;
 final Color beginColor;
 final Color endColor;
  @override
  _AnimatedTextWidgetState createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget> with SingleTickerProviderStateMixin {
 
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
      begin: widget.beginColor,
      end: widget.endColor,
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: colorAnimation,
      builder: (context, child) {
        return MyTextWidget(
          text: widget.textTitle,
          color: colorAnimation.value ?? Colors.white,
          size: widget.textSize,
          weight: FontWeight.bold,
          maxline: true,
          alignTextCenter: true,
        );
      },
    );
  }
}
