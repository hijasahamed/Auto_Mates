import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/seller_details/seller_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                icon: const Icon(
                  Icons.calendar_month_rounded,
                  color: Color.fromARGB(255, 118, 118, 118),
                )),
            CarMoreDetails(
                text: data['kilometer'],
                icon: const Icon(Icons.calculate,
                    color: Color.fromARGB(255, 118, 118, 118))),
            CarMoreDetails(
                text: data['fuel'],
                icon: const Icon(Icons.gas_meter_outlined,
                    color: Color.fromARGB(255, 118, 118, 118))),
            const CarMoreDetails(
                text: 'Automatic',
                icon: Icon(FontAwesomeIcons.gear,
                    color: Color.fromARGB(255, 118, 118, 118))),
            const CarMoreDetails(
                text: 'Calicut',
                icon: Icon(FontAwesomeIcons.locationDot,
                    color: Color.fromARGB(255, 118, 118, 118))),
          ],
        ),
      ),
    );
  }
}
