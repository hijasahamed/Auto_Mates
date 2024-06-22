import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/emicalculator/view/widgets/button_interest_holder_widget.dart';
import 'package:auto_mates/user/emicalculator/view/widgets/emi_amount_slider_holder_widget.dart';
import 'package:auto_mates/user/emicalculator/view/widgets/emi_screen_opening_text_widget.dart';
import 'package:auto_mates/user/emicalculator/view/widgets/emi_tenure_interest_widget.dart';
import 'package:flutter/material.dart';

class EmiCalculatorScreen extends StatelessWidget {
  const EmiCalculatorScreen({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: NormalAppBar(title: 'Emi Calculator')),
        body: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                EmiScreenOpeningTextWidget(
                  screenSize: screenSize,
                ),
                EmiAmountSliderHolderWidget(
                  screenSize: screenSize,
                ),
                EmiTenureInterestWidget(
                  screenSize: screenSize,
                ),
                ButtonAndInterestHolderWidget(screenSize: screenSize)
              ],
            ),
          ),
        ));
  }
}
