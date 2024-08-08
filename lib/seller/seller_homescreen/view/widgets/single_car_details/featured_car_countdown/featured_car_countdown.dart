import 'dart:async';

import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedCarCountdown extends StatefulWidget {
  const FeaturedCarCountdown(
      {super.key, required this.startTime, required this.endTime,required this.screenSize,required this.carData});
  final DateTime startTime;
  final DateTime endTime;
  final Size screenSize;
  final dynamic carData;
  @override
  State<FeaturedCarCountdown> createState() => _FeaturedCarCountdownState();
}

class _FeaturedCarCountdownState extends State<FeaturedCarCountdown> {
  late Timer timer;
  Duration remainingTime = Duration.zero;
  SellerHomeScreenBloc refreshTimerBlocObj = SellerHomeScreenBloc();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    remainingTime = widget.endTime.difference(DateTime.now());
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remainingTime = widget.endTime.difference(DateTime.now());
      if (remainingTime.isNegative) {
        timer.cancel();
      }
      refreshTimerBlocObj.add(FeaturedCarsRemainingTimeEvent());
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellerHomeScreenBloc, SellerHomeScreenState>(
      bloc: refreshTimerBlocObj,
      builder: (context, state) {
        if (remainingTime.isNegative) {
         deleteExpiredFeaturedCar(widget.carData['regNumber']);
         return const SizedBox.shrink();
        } else {
          final days = remainingTime.inDays;
          final hours = remainingTime.inHours.remainder(24);
          final minutes = remainingTime.inMinutes.remainder(60);
          final seconds = remainingTime.inSeconds.remainder(60);

          String timeString;
          if (days > 0) {
            timeString = '$days days ${hours}h ${minutes}m ${seconds}s left';
          } else if (hours > 0) {
            timeString = '${hours}h ${minutes}m ${seconds}s left';
          } else if (minutes > 0) {
            timeString = '${minutes}m ${seconds}s left';
          } else {
            timeString = '${seconds}s left';
          }

          return Row(
            children: [
              MyTextWidget(text: 'Featured Car', color: Colors.green, size: widget.screenSize.width/25, weight: FontWeight.bold),
              SizedBox(width: widget.screenSize.width/50,),
              MyTextWidget(text: timeString, color: Colors.red, size: widget.screenSize.width/32, weight: FontWeight.w600),
            ],
          );

        }
      },
    );
  }
}
