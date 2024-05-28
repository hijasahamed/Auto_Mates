import 'package:auto_mates/user/appbarbottombar/view/widgets/app_bar_gradient_color.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/emicalculator/view/widgets/button_interest_holder_widget.dart';
import 'package:auto_mates/user/emicalculator/view/widgets/emi_amount_slider_holder_widget.dart';
import 'package:auto_mates/user/emicalculator/view/widgets/emi_screen_opening_text_widget.dart';
import 'package:auto_mates/user/emicalculator/view/widgets/emi_tenure_interest_widget.dart';
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
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Card(
            elevation: 5,
            color: const Color(0xFFDBEDF5),
            child: Column(
              children: [
                EmiScreenOpeningTextWidget(screenSize: screenSize,),
                EmiAmountSliderHolderWidget(screenSize: screenSize,),
                EmiTenureInterestWidget(screenSize: screenSize,),
                ButtonAndInterestHolderWidget(screenSize: screenSize)
              ],
            ),
          ),
        ),
      )
    );
  }
}