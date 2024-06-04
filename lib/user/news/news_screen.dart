import 'package:auto_mates/user/commonwidgets/shimmer_effect/shimmer_effect.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // return const Center(
    //   child: Text('News Screen'),
    // );
    return SkelotonIndicatorGrid(screenSize: screenSize);
  }
}