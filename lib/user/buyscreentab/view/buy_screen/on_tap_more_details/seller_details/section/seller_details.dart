import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
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
          MyTextWidget(text: data, color: const Color(0xFF424141), size: screenSize.width/30, weight: FontWeight.w600)
        ],
      ),
    );
  }
}