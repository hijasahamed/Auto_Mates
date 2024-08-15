import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:flutter/material.dart';

class PremiumSellerCountdown extends StatelessWidget {
  const PremiumSellerCountdown({super.key,required this.screenSize,required this.data});
  final Size screenSize;
  final SellerData data;
  @override
  Widget build(BuildContext context) {
    return Text('Premium seller');
  }
}