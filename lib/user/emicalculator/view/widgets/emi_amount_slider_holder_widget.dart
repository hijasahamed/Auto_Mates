import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/emicalculator/controllers/function.dart';
import 'package:auto_mates/user/emicalculator/view/bloc/emi_calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmiAmountSliderHolderWidget extends StatelessWidget {
  const EmiAmountSliderHolderWidget({super.key, required this.screenSize});
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    EmiCalculatorBloc loanAmountSliderBloc = EmiCalculatorBloc();
    return BlocBuilder<EmiCalculatorBloc, EmiCalculatorState>(
      bloc: loanAmountSliderBloc,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Slider(
                activeColor: const Color.fromARGB(255, 22, 190, 118),
                inactiveColor: const Color.fromARGB(255, 237, 237, 237),
                thumbColor: const Color.fromARGB(255, 22, 190, 118),
                value: loanAmount,
                min: 0,
                max: 1000000,
                divisions: 20,
                label: '₹${loanAmount.toStringAsFixed(0)}',
                onChanged: (double value) {
                  loanAmount = value;
                  loanAmountSliderBloc.add(LoanAmountSliderRefreshEvent());
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      MyTextWidget(
                          text: '₹1,00,000',
                          color: const Color.fromARGB(255, 91, 91, 91),
                          size: screenSize.width/35,
                          weight: FontWeight.bold),
                      MyTextWidget(
                          text: 'Min.Loan Amount',
                          color: const Color.fromARGB(255, 91, 91, 91),
                          size: screenSize.width/35,
                          weight: FontWeight.bold),
                    ],
                  ),
                  Column(
                    children: [
                      MyTextWidget(
                          text: '₹10,00,000',
                          color: const Color.fromARGB(255, 91, 91, 91),
                          size: screenSize.width/35,
                          weight: FontWeight.bold),
                      MyTextWidget(
                          text: 'Min.Loan Amount',
                          color: const Color.fromARGB(255, 91, 91, 91),
                          size: screenSize.width/35,
                          weight: FontWeight.bold),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: screenSize.height / 40,
                child: const MyTextWidget(text: 'Loan Amount', color: Colors.black, size: 15, weight: FontWeight.bold),
              ),
              Container(
                height: screenSize.height / 17,
                width: screenSize.width / 1.3,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: const Color.fromARGB(255, 210, 210, 210)),
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 241, 241, 241)),
                child: Center(
                    child: MyTextWidget(
                        text: '₹${loanAmount.toInt()}',
                        color: Colors.black,
                        size: screenSize.width/15,
                        weight: FontWeight.bold)),
              ),
            ],
          ),
        );
      },
    );
  }
}
