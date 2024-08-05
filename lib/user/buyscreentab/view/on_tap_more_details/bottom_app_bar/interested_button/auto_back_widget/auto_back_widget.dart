// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:auto_mates/seller/seller_homescreen/controller/payments_services.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/bottom_app_bar/interested_button/auto_back_widget/auto_back_widgets_sections/auto_back_widget_back_button.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/bottom_app_bar/interested_button/auto_back_widget/auto_back_widgets_sections/auto_back_widget_content.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/bottom_app_bar/interested_button/auto_back_widget/auto_back_widgets_sections/auto_back_widget_interested_loader.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/bottom_app_bar/interested_button/auto_back_widget/auto_back_widgets_sections/auto_back_widget_title.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AutoBackWidget extends StatefulWidget {
  const AutoBackWidget(
      {super.key,
      required this.screenSize,
      required this.data,
      this.isFromSearch,
      required this.carAddingToInterestedLoader});
  final Size screenSize;
  final dynamic data;
  final bool? isFromSearch;
  final BuyScreenBloc carAddingToInterestedLoader;
  @override
  State<AutoBackWidget> createState() => _AutoBackWidgetState();
}

bool isChecked = false;
bool fillCheckedBox = false;

class _AutoBackWidgetState extends State<AutoBackWidget> {
  late int secondsLeft;
  late Timer timer;
  BuyScreenBloc refreshTimerBlocObj = BuyScreenBloc();
  BuyScreenBloc interestButtonLoaderObj = BuyScreenBloc();
  BuyScreenBloc checkBoxRefreshObj = BuyScreenBloc();
  BuyScreenBloc fillCheckedBoxAlertRefreshObj = BuyScreenBloc();

  @override
  void initState() {
    super.initState();
    secondsLeft = 300;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft > 0) {
        secondsLeft--;
        refreshTimerBlocObj.add(RefreshIntrestedAutoTimerEvent());
      } else {
        Navigator.of(context).pop();
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    isChecked = false;
    fillCheckedBox = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: AutoBackWidgetTitle(screenSize: widget.screenSize),
      content: AutoBackWidgetContent(
        screenSize: widget.screenSize,
        checkBoxRefreshObj: checkBoxRefreshObj,
        fillCheckedBoxAlertRefreshObj: fillCheckedBoxAlertRefreshObj,
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<BuyScreenBloc, BuyScreenState>(
              bloc: refreshTimerBlocObj,
              builder: (context, state) {
                return AutoBackWidgetBackButton(
                    refreshTimerBlocObj: refreshTimerBlocObj,
                    screenSize: widget.screenSize,
                    secondsLeft: secondsLeft);
              },
            ),
            BlocBuilder<BuyScreenBloc, BuyScreenState>(
              bloc: checkBoxRefreshObj,
              builder: (context, state) {
                return SizedBox(
                  width: widget.screenSize.width / 2.6,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (isChecked == true) {
                          interestButtonLoaderObj.add(InterestButtoncircularLoaderEvent());
                          dynamic pay = await StripePaymentService.instance
                              .makePayment()
                              .then((value) => value == true ? true : false);
                          pay == true
                              ? {
                                  Navigator.of(context).pop(),
                                  widget.carAddingToInterestedLoader
                                      .add(CarAddingToInterestedEvent()),
                                }
                              : {
                                  Navigator.of(context).pop(),
                                  snackbarWidget(
                                      'Payment Failed',
                                      context,
                                      Colors.red,
                                      Colors.white,
                                      SnackBarBehavior.fixed),
                                };
                        } else {
                          fillCheckedBox = true;
                          checkBoxRefreshObj
                              .add(FillCheckedBoxAlertRefreshEvent());
                          fillCheckedBoxAlertRefreshObj
                              .add(FillCheckedBoxAlertRefreshEvent());
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                        isChecked ? Colors.green : Colors.green[200],
                      )),
                      child: BlocBuilder<BuyScreenBloc, BuyScreenState>(
                        bloc: interestButtonLoaderObj,
                        builder: (context, state) {
                          if (state is InterestButtoncircularLoaderState) {
                            return AutoBackWidgetInterestedLoader(screenSize: widget.screenSize);
                          } else {
                            return MyTextWidget(
                                text: 'Mark as Intrested',
                                color: Colors.white,
                                size: widget.screenSize.width / 30,
                                weight: FontWeight.bold);
                          }
                        },
                      )),
                );
              },
            )
          ],
        )
      ],
    );
  }
}
