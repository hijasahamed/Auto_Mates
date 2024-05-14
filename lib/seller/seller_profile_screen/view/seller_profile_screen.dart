import 'package:auto_mates/seller/seller_profile_screen/view/widget/banner_card_widget.dart';
import 'package:flutter/material.dart';

class SellerProfileScreen extends StatelessWidget {
  const SellerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            BannerCardWidget(screenSize: screenSize,)
          ],
        ),
      ),
    );
  }
}