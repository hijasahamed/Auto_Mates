import 'dart:math';

import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/emicalculator/view/bloc/emi_calculator_bloc.dart';
import 'package:flutter/material.dart';

double loanAmount = 0;
double tenure = 0;
double interest = 0;

calculateEmi({emiPayableBloc, context}) {
  if (loanAmount != 0 && tenure != 0 && interest != 0) {
    var principal = loanAmount.toDouble();
    var annualInterestRate = interest.toDouble();
    var loanTenureYears = tenure.toDouble();

    var monthlyInterestRate = annualInterestRate / (12 * 100);
    var loanTenureMonths = loanTenureYears * 12;

    var emi = (principal *
            monthlyInterestRate *
            pow((1 + monthlyInterestRate), loanTenureMonths)) /
        (pow((1 + monthlyInterestRate), loanTenureMonths) - 1);

    var emiPayableFormatted = double.parse(emi.toStringAsFixed(2));

    emiPayableBloc.add(EmiLoadingEvent());

    Future.delayed(const Duration(seconds: 2), () {
      emiPayableBloc.add(EmiPerMonthValueRefreshEvent(emiPayable: emiPayableFormatted));
    });
  } else {
    snackbarWidget('Provide full details', context, Colors.red, Colors.white,
        SnackBarBehavior.fixed);
  }
}
