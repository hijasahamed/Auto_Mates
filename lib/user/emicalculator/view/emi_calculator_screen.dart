import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/emicalculator/view/widgets/button_interest_holder_widget.dart';
import 'package:auto_mates/user/emicalculator/view/widgets/emi_amount_slider_holder_widget.dart';
import 'package:auto_mates/user/emicalculator/view/widgets/emi_tenure_interest_widget.dart';
import 'package:flutter/material.dart';

class EmiCalculatorScreen extends StatelessWidget {
  const EmiCalculatorScreen({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenSize.height/4.5),
          child: const NormalAppBar(
            title: 'Emi Calculator',
            isFromEmi: true,
          )),
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              EmiAmountSliderHolderWidget(
                screenSize: screenSize,
              ),
              EmiTenureInterestWidget(
                screenSize: screenSize,
              ),
              ButtonAndInterestHolderWidget(screenSize: screenSize),
            ],
          ),
        ),
      ),
    );
  }
}
