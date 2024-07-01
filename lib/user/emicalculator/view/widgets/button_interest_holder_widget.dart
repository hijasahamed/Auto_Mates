import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/emicalculator/controllers/function.dart';
import 'package:auto_mates/user/emicalculator/view/bloc/emi_calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonAndInterestHolderWidget extends StatelessWidget {
  const ButtonAndInterestHolderWidget({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    EmiCalculatorBloc emiPayableBloc = EmiCalculatorBloc();
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 22, 190, 118),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              calculateEmi(context: context, emiPayableBloc: emiPayableBloc);
            },
            child: Container(
              height: screenSize.height / 17,
              width: screenSize.width / 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: MyTextWidget(
                  text: 'Calculate EMI',
                  color: Colors.white,
                  size: screenSize.width / 25,
                  weight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: screenSize.height / 50,
        ),
        Card(
          color: const Color.fromARGB(255, 241, 241, 241),
          elevation: 5,
          child: SizedBox(
            height: screenSize.height / 6,
            width: screenSize.width / 1.7,
            child: BlocBuilder<EmiCalculatorBloc, EmiCalculatorState>(
              bloc: emiPayableBloc,
              builder: (context, state) {
                if (state is EmiLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.blue,),
                  );
                } else if (state is EmiPerMonthValueRefreshState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyTextWidget(
                          text: 'EMI Payable per month',
                          color: Colors.black,
                          size: screenSize.width / 30,
                          weight: FontWeight.bold),
                      MyTextWidget(
                          text: '₹${state.emiPayable.toStringAsFixed(2)}',
                          color: Colors.red,
                          size: screenSize.width / 12,
                          weight: FontWeight.bold),
                      MyTextWidget(
                          text: 'for ${tenure.toInt()} years',
                          color: Colors.black,
                          size: screenSize.width / 30,
                          weight: FontWeight.bold),
                    ],
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextWidget(
                        text:
                            'Your Monthly EMI For The Loan Amount Will Be Shown Here',
                        color: const Color.fromARGB(255, 169, 169, 169),
                        size: screenSize.width/30,
                        weight: FontWeight.bold,
                        maxline: true,
                        alignTextCenter: true,
                      ),
                      Icon(Icons.currency_rupee_rounded,size: screenSize.height/15,color: Colors.red,)
                    ],
                  );
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
