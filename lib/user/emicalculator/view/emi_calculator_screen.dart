import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/emicalculator/controllers/function.dart';
import 'package:auto_mates/user/emicalculator/view/widgets/button_interest_holder_widget.dart';
import 'package:auto_mates/user/emicalculator/view/widgets/emi_amount_slider_holder_widget.dart';
import 'package:auto_mates/user/emicalculator/view/widgets/emi_tenure_interest_widget.dart';
import 'package:flutter/material.dart';

class EmiCalculatorScreen extends StatefulWidget {
  const EmiCalculatorScreen({super.key, required this.screenSize});
  final Size screenSize;

  @override
  State<EmiCalculatorScreen> createState() => _EmiCalculatorScreenState();
}

class _EmiCalculatorScreenState extends State<EmiCalculatorScreen> {
  @override
  void dispose() {
    loanAmount=0;
    tenure=0;
    interest=0;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(widget.screenSize.height/4.3),
          child: const NormalAppBar(
            title: 'Emi Calculator',
            isFromEmi: true,
          )),
      body: SizedBox(
        height: widget.screenSize.height,
        width: widget.screenSize.width,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              EmiAmountSliderHolderWidget(
                screenSize: widget.screenSize,
              ),
              EmiTenureInterestWidget(
                screenSize: widget.screenSize,
              ),
              ButtonAndInterestHolderWidget(screenSize: widget.screenSize),
            ],
          ),
        ),
      ),
    );
  }
}
