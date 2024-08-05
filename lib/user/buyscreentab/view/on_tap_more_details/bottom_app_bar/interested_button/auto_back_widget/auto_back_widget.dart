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

class _AutoBackWidgetState extends State<AutoBackWidget> {
  late int secondsLeft;
  late Timer timer;
  BuyScreenBloc refreshTimerBlocObj = BuyScreenBloc();
  BuyScreenBloc interestButtonLoaderObj = BuyScreenBloc();

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: AutoBackWidgetTitle(screenSize: widget.screenSize),
      content: AutoBackWidgetContent(screenSize: widget.screenSize),
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
            BlocBuilder(
              bloc: interestButtonLoaderObj,
              builder: (context, state) {
                if (state is InterestButtoncircularLoaderState) {
                  return AutoBackWidgetInterestedLoader(
                      screenSize: widget.screenSize);
                } else {
                  return ElevatedButton(
                      onPressed: () async {
                        interestButtonLoaderObj
                            .add(InterestButtoncircularLoaderEvent());
                        dynamic pay = await StripePaymentService.instance
                            .makePayment()
                            .then((value) => value == true ? true : false);
                        pay == true
                            ? {                                
                                Navigator.of(context).pop(),
                                widget.carAddingToInterestedLoader.add(CarAddingToInterestedEvent()),                                
                              }
                            : {
                                snackbarWidget(
                                    'Payment Failed',
                                    context,
                                    Colors.red,
                                    Colors.white,
                                    SnackBarBehavior.fixed),
                                Navigator.of(context).pop()
                              };
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.green)),
                      child: MyTextWidget(
                          text: 'Mark as Intrested',
                          color: Colors.white,
                          size: widget.screenSize.width / 30,
                          weight: FontWeight.bold));
                }
              },
            )
          ],
        )
      ],
    );
  }
}
