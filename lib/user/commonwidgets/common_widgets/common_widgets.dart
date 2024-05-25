import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({super.key,required this.text,required this.color,required this.size,required this.weight});
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontWeight: weight,color: color,fontSize: size,overflow: TextOverflow.ellipsis,),);
  }
}


snackbarWidget(String text, context, Color color, Color textColor,SnackBarBehavior behavior) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    elevation: 4,
    dismissDirection: DismissDirection.horizontal,
    duration: const Duration(milliseconds: 2100),
    behavior: behavior,
    backgroundColor: color,
    margin: const EdgeInsets.all(50),
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
    ),
  ));
}