import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/seller_details/seller_details_screen.dart';
import 'package:flutter/material.dart';

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({
    super.key,
    required this.screenSize,
    required this.data,
  });
  final Size screenSize;
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height / 12,
      width: screenSize.width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CarMoreDetails(
                text: data['year'],
                screenSize: screenSize,
                image: const AssetImage('assets/images/calender.png'),
                ),
            CarMoreDetails(
                text: data['kilometer'],
                screenSize: screenSize,
                image: const AssetImage('assets/images/kilometers.png'),
               ),
            CarMoreDetails(
                text: data['fuel'],
                screenSize: screenSize,
                image: const AssetImage('assets/images/fuel.png'),
                ),
            CarMoreDetails(
                text: data['transmission'],
                screenSize: screenSize,
                image: const AssetImage('assets/images/gear.png'),
                ),
            CarMoreDetails(
                text: data['regNumber'].substring(0, 4),
                screenSize: screenSize,
                image: const AssetImage('assets/images/reg loc.png'),
               ),
          ],
        ),
      ),
    );
  }
}
