import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class EmiTenureInterestWidget extends StatelessWidget {
  const EmiTenureInterestWidget({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyTextWidget(
              text: 'Select the Tenure and Interest',
              color: Color.fromARGB(255, 91, 91, 91),
              size: 15,
              weight: FontWeight.bold),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: screenSize.height / 5,
                width: screenSize.width / 2.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyTextWidget(
                            text: 'Tenure',
                            color: Colors.black,
                            size: 27,
                            weight: FontWeight.bold),
                        MyTextWidget(
                            text: '(Years)',
                            color: Color.fromARGB(255, 91, 91, 91),
                            size: 10,
                            weight: FontWeight.bold)
                      ],
                    ),
                    const Divider(
                      thickness: 5,
                      color: Colors.green,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyTextWidget(
                            text: '1 Year',
                            color: Color.fromARGB(255, 91, 91, 91),
                            size: 12,
                            weight: FontWeight.bold),
                        MyTextWidget(
                            text: '8 Year',
                            color: Color.fromARGB(255, 91, 91, 91),
                            size: 12,
                            weight: FontWeight.bold)
                      ],
                    ),
                    Container(
                      height: screenSize.height / 18,
                      width: screenSize.width / 1.3,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 141, 140, 140)),
                      ),
                      child: const Center(child: MyTextWidget(text: '3', color: Colors.black, size: 30, weight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: screenSize.height / 5,
                width: screenSize.width / 2.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyTextWidget(
                            text: 'Interest',
                            color: Colors.black,
                            size: 27,
                            weight: FontWeight.bold),
                        MyTextWidget(
                            text: '(%)',
                            color: Color.fromARGB(255, 91, 91, 91),
                            size: 10,
                            weight: FontWeight.bold)
                      ],
                    ),
                    const Divider(
                      thickness: 5,
                      color: Colors.green,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyTextWidget(
                            text: '(7%)',
                            color: Color.fromARGB(255, 91, 91, 91),
                            size: 12,
                            weight: FontWeight.bold),
                        MyTextWidget(
                            text: '(11%)',
                            color: Color.fromARGB(255, 91, 91, 91),
                            size: 12,
                            weight: FontWeight.bold)
                      ],
                    ),
                    Container(
                      height: screenSize.height / 18,
                      width: screenSize.width / 1.3,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 141, 140, 140)),
                      ),
                      child: const Center(child: MyTextWidget(text: '8', color: Colors.black, size: 30, weight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
