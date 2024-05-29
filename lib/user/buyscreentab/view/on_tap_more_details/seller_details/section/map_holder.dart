import 'package:flutter/material.dart';

class MapHolder extends StatelessWidget {
  const MapHolder({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        height: screenSize.height / 7.5,
        width: screenSize.width / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: const DecorationImage(
                image: AssetImage('assets/images/gmap.png'),
                fit: BoxFit.cover,
                opacity: 1)),
        child: const Center(
          child: Icon(
            Icons.place,
            size: 60,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
