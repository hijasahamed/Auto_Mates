// ignore_for_file: use_build_context_synchronously
import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/seller/seller_homescreen/controller/payments_services.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/bottom_app_bar/interested_button/auto_back_widget/auto_back_widgets_sections/auto_back_widget_back_button.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/bottom_app_bar/interested_button/auto_back_widget/auto_back_widgets_sections/auto_back_widget_content.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/bottom_app_bar/interested_button/auto_back_widget/auto_back_widgets_sections/auto_back_widget_interested_loader.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/bottom_app_bar/interested_button/auto_back_widget/auto_back_widgets_sections/auto_back_widget_title.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
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
int amountToMarkInterest = 999;
bool isdeductingPoints = false;
int deductedAmount = 0;

class _AutoBackWidgetState extends State<AutoBackWidget> {
  BuyScreenBloc interestButtonLoaderObj = BuyScreenBloc();
  BuyScreenBloc checkBoxRefreshObj = BuyScreenBloc();
  BuyScreenBloc fillCheckedBoxAlertRefreshObj = BuyScreenBloc();

  @override
  void dispose() {
    isChecked = false;
    fillCheckedBox = false;
    amountToMarkInterest = 999;
    isdeductingPoints = false;
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
            AutoBackWidgetBackButton(screenSize: widget.screenSize,),
            BlocBuilder<BuyScreenBloc, BuyScreenState>(
              bloc: checkBoxRefreshObj,
              builder: (context, state) {
                return SizedBox(
                  width: widget.screenSize.width / 2.3,
                  child: ElevatedButton(
                      onPressed: () async {
                        UserData? user = await fetchUserDetails();
                        if (isChecked == true) {
                          interestButtonLoaderObj.add(InterestButtoncircularLoaderEvent());
                          dynamic pay = await StripePaymentService.instance
                              .makePayment(amountToPay: amountToMarkInterest)
                              .then((value) => value == true ? true : false);
                          pay == true
                              ? {                                   
                                  addRevenueDataToDataBase(amount: amountToMarkInterest.toDouble(), paidBy: user!.userName, paidFor: 'Marking Interest'),
                                  Navigator.of(context).pop(),
                                  widget.carAddingToInterestedLoader.add(CarAddingToInterestedEvent()),
                                }
                              : {
                                  Navigator.of(context).pop(),
                                  amountToMarkInterest = 999,
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
                                text: 'Pay ₹$amountToMarkInterest',
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
