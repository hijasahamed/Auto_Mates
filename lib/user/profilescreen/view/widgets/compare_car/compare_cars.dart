import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/compare_car/compare_section/compare_section.dart';
import 'package:flutter/material.dart';

class CompareCars extends StatelessWidget {
  const CompareCars({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: NormalAppBar(title: 'Compare Cars')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextWidget(
                text: 'Select the car varient you want to compare',
                color: Colors.blueGrey,
                size: screenSize.width / 25,
                weight: FontWeight.bold),
          ),
          CompareSection(screenSize: screenSize)
        ],
      ),
    );
  }
}
