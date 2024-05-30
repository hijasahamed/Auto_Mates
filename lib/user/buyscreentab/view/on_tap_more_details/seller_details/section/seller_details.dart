import 'package:flutter/material.dart';

class SellersDetail extends StatelessWidget {
  const SellersDetail({super.key, required this.icon, required this.data,required this.screenSize});
  final IconData icon;
  final String data;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: screenSize.width/75,),
          Text(
            data,
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Color(0xFF424141)),
          )
        ],
      ),
    );
  }
}