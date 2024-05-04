import 'package:auto_mates/appbarbottombar/view/widgets/app_bar_gradient_color.dart';
import 'package:auto_mates/commonwidgets/my_text_widget.dart';
import 'package:auto_mates/emicalculator/view/widgets/emi_amount_slider_holder_widget.dart';
import 'package:auto_mates/emicalculator/view/widgets/emi_screen_opening_text_widget.dart';
import 'package:flutter/material.dart';

class EmiCalculatorScreen extends StatelessWidget {
  const EmiCalculatorScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const AppBarGradientColor(),
        title: const MyTextWidget(text: 'EMI Calculator', color: Colors.white, size: 19, weight: FontWeight.bold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            EmiScreenOpeningTextWidget(screenSize: screenSize,),
            EmiAmountSliderHolderWidget(screenSize: screenSize,),
          ],
        ),
      )
    );
  }
}