import 'package:flutter/material.dart';

class FavouriteContainer extends StatelessWidget {
  const FavouriteContainer({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height/7, 
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
      ),
    );
  }
}