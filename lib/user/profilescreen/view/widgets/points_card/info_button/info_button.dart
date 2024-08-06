import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  width: screenSize.width * 0.8,
                  padding: EdgeInsets.all(screenSize.width / 100),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyTextWidget(
                            text: 'Coins Information',
                            color: Colors.blueGrey,
                            size: screenSize.width / 25,
                            weight: FontWeight.bold,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.close,
                                size: screenSize.width / 18,
                              ))
                        ],
                      ),
                      SizedBox(height: screenSize.width / 30),
                      MyTextWidget(
                        text:
                            'You can use AutoMates Coins to purchase various items and services within the app.',
                        color: Colors.black87,
                        maxline: true,
                        size: screenSize.width / 30,
                        weight: FontWeight.normal,
                      ),
                      SizedBox(height: screenSize.width / 30),
                      MyTextWidget(
                        text:
                            'AutoMates Coins are generated with the refunds of your payments within the app',
                        color: Colors.black87,
                        size: screenSize.width / 30,
                        maxline: true,
                        weight: FontWeight.normal,
                      ),
                      SizedBox(height: screenSize.width / 30),
                      MyTextWidget(
                        text:
                            'Only 40% of the total payment will be refunded.This refund will not be paid to any Bank related Accounts.It will be generated as the AutoMates Coins in the AutoMAtes App.',
                        color: Colors.black87,
                        size: screenSize.width / 30,
                        maxline: true,
                        weight: FontWeight.normal,
                      ),
                      SizedBox(height: screenSize.width / 30),
                      MyTextWidget(
                        text: '1 AutoMates Coin = INR 1',
                        color: Colors.green,
                        size: screenSize.width / 30,
                        maxline: true,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        icon: Icon(
          Icons.info,
          color: Colors.grey,
          size: screenSize.width / 16,
        ));
  }
}
