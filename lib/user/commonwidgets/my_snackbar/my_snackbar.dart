import 'package:flutter/material.dart';

snackbarWidget(String text, context, Color color, Color textColor,SnackBarBehavior behavior) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.horizontal,
    duration: const Duration(milliseconds: 1700),
    behavior: behavior,
    backgroundColor: color,    
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
    ),
  ));
}
