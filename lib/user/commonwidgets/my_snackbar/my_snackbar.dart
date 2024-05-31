import 'package:flutter/material.dart';

snackbarWidget(String text, context, Color color, Color textColor,SnackBarBehavior behavior) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.horizontal,
    duration: const Duration(milliseconds: 2100),
    behavior: behavior,
    backgroundColor: color,
    animation: CurvedAnimation(
      parent: AnimationController(
        vsync: Scaffold.of(context),
        duration: const Duration(seconds: 6),
      ),
      curve: Curves.easeInOut,
    ),
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
    ),
  ));
}
