import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

class SellerLogoutWidget extends StatelessWidget {
  const SellerLogoutWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Ink(
      height: screenSize.height/16,
      width: screenSize.width/2.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red
      ),
      child: InkWell(
        onTap: () {
          
        },
        child: const Center(
          child: MyTextWidget(text: 'Logout', color: Colors.white, size: 18, weight: FontWeight.bold),
        ),
      ),
    );
  }
}