import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  const MyTextWidget(
      {super.key,
      required this.text,
      required this.color,
      this.maxline,
      required this.size,
      required this.weight});
  final String text;
  final Color color;
  final double size;
  final bool? maxline;
  final FontWeight weight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: weight,
        color: color,
        fontSize: size,
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: (maxline==true)? 10 :1,
    );
  }
}
