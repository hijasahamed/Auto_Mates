import 'dart:async';
import 'package:auto_mates/seller/seller_profile_screen/controllers/functions.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/bloc/seller_profile_bloc.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PremiumPlanCounter extends StatefulWidget {
  const PremiumPlanCounter({super.key,required this.screenSize,required this.endTime,required this.sellerId});
  final Size screenSize;
  final DateTime endTime;
  final String sellerId;
  @override
  State<PremiumPlanCounter> createState() => _PremiumPlanCounterState();
}

class _PremiumPlanCounterState extends State<PremiumPlanCounter> {

  late Timer timer;
  Duration remainingTime = Duration.zero;
  SellerProfileBloc premiumCounterBlocInstance = SellerProfileBloc();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    remainingTime = widget.endTime.difference(DateTime.now());
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remainingTime = widget.endTime.difference(DateTime.now());
      if (remainingTime.isNegative) {
        timer.cancel();
      }
      premiumCounterBlocInstance.add(PremiumPlanCounterRefreshEvent());
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellerProfileBloc, SellerProfileState>(
      bloc: premiumCounterBlocInstance,
      builder: (context, state) {
        if (remainingTime.isNegative) {
          changeSellersSubscriptionPlan(sellerId: widget.sellerId);
          return const SizedBox.shrink();
        } else {
          final days = remainingTime.inDays;
          final hours = remainingTime.inHours.remainder(24);
          final minutes = remainingTime.inMinutes.remainder(60);
          final seconds = remainingTime.inSeconds.remainder(60);

          String timeString;
          if (days > 0) {
            timeString = '$days days left';
          } else if (hours > 0) {
            timeString = '${hours}h ${minutes}m ${seconds}s left';
          } else if (minutes > 0) {
            timeString = '${minutes}m ${seconds}s left';
          } else {
            timeString = '${seconds}s left';
          }

          return MyTextWidget(text: timeString, color: Colors.red, size: widget.screenSize.width/32, weight: FontWeight.w600);

        }
      },
    );
  }
}
