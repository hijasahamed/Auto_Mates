import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/emicalculator/controllers/function.dart';
import 'package:auto_mates/user/emicalculator/view/bloc/emi_calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmiTenureInterestWidget extends StatelessWidget {
  const EmiTenureInterestWidget({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    EmiCalculatorBloc tenureAmountSliderBloc = EmiCalculatorBloc();
    EmiCalculatorBloc interestAmountSliderBloc = EmiCalculatorBloc();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<EmiCalculatorBloc, EmiCalculatorState>(
                bloc: tenureAmountSliderBloc,
                builder: (context, state) {
                  return SizedBox(
                    height: screenSize.height / 5,
                    width: screenSize.width / 2.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextWidget(
                            text: 'Tenure',
                            color: Colors.black,
                            size: screenSize.width / 24,
                            weight: FontWeight.bold),
                        Slider(
                          activeColor: Colors.green,
                          inactiveColor: const Color.fromARGB(255, 237, 237, 237),
                          thumbColor: Colors.green,
                          value: tenure,
                          min: 0,
                          max: 5,
                          divisions: 5,
                          label: '${tenure.toStringAsFixed(0)}year',
                          onChanged: (double value) {
                            tenure = value;
                            tenureAmountSliderBloc.add(LoanAmountSliderRefreshEvent());
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyTextWidget(
                                text: '1 Year',
                                color: const Color.fromARGB(255, 91, 91, 91),
                                size: screenSize.width / 35,
                                weight: FontWeight.bold),
                            MyTextWidget(
                                text: '5 Year',
                                color: const Color.fromARGB(255, 91, 91, 91),
                                size: screenSize.width / 35,
                                weight: FontWeight.bold)
                          ],
                        ),
                        SizedBox(height: screenSize.height/100,),
                        Container(
                          height: screenSize.height / 18,
                          width: screenSize.width / 1.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 241, 241, 241),
                            border: Border.all(
                                width: 2,
                                color:
                                    const Color.fromARGB(255, 219, 219, 219)),
                          ),
                          child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyTextWidget(
                                      text: '${tenure.toInt()}',
                                      color: Colors.black,
                                      size: screenSize.width / 18,
                                      weight: FontWeight.bold),
                                      SizedBox(width: screenSize.width/100,),
                                  MyTextWidget(
                                      text: 'year',
                                      color: const Color.fromARGB(255, 126, 126, 126),
                                      size: screenSize.width / 30,
                                      weight: FontWeight.bold),
                                ],
                              )),
                        )
                      ],
                    ),
                  );
                },
              ),
              BlocBuilder<EmiCalculatorBloc, EmiCalculatorState>(
                bloc: interestAmountSliderBloc,
                builder: (context, state) {
                  return SizedBox(
                    height: screenSize.height / 5,
                    width: screenSize.width / 2.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextWidget(
                            text: 'Interest',
                            color: Colors.black,
                            size: screenSize.width / 24,
                            weight: FontWeight.bold),
                        Slider(
                          activeColor: Colors.green,
                          inactiveColor: const Color.fromARGB(255, 237, 237, 237),
                          thumbColor: Colors.green,
                          value: interest,
                          min: 0,
                          max: 10,
                          divisions: 10,
                          label: '${interest.toStringAsFixed(0)}%',
                          onChanged: (double value) {
                            interest = value;
                            interestAmountSliderBloc.add(LoanAmountSliderRefreshEvent());
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyTextWidget(
                                text: '1%',
                                color: const Color.fromARGB(255, 91, 91, 91),
                                size: screenSize.width / 35,
                                weight: FontWeight.bold),
                            MyTextWidget(
                                text: '10%',
                                color: const Color.fromARGB(255, 91, 91, 91),
                                size: screenSize.width / 35,
                                weight: FontWeight.bold)
                          ],
                        ),
                        SizedBox(height: screenSize.height/100,),
                        Container(
                          height: screenSize.height / 18,
                          width: screenSize.width / 1.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 241, 241, 241),
                            border: Border.all(
                                width: 2,
                                color:
                                    const Color.fromARGB(255, 219, 219, 219)),
                          ),
                          child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyTextWidget(
                                      text: '${interest.toInt()}',
                                      color: Colors.black,
                                      size: screenSize.width / 18,
                                      weight: FontWeight.bold),
                                      SizedBox(width: screenSize.width/100,),
                                  MyTextWidget(
                                      text: '%',
                                      color: const Color.fromARGB(255, 126, 126, 126),
                                      size: screenSize.width / 30,
                                      weight: FontWeight.bold),
                                ],
                              )),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
