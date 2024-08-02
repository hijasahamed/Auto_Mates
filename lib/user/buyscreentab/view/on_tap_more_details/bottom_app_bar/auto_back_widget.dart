import 'dart:async';

import 'package:auto_mates/seller/seller_homescreen/controller/subscription_services.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AutoBackWidget extends StatefulWidget {
  const AutoBackWidget(
      {super.key,
      required this.screenSize,
      required this.data,
      this.isFromSearch});
  final Size screenSize;
  final dynamic data;
  final bool? isFromSearch;
  @override
  State<AutoBackWidget> createState() => _AutoBackWidgetState();
}

class _AutoBackWidgetState extends State<AutoBackWidget> {
  late int secondsLeft;
  late Timer timer;
  BuyScreenBloc refreshTimerBlocObj = BuyScreenBloc();

  @override
  void initState() {
    super.initState();
    secondsLeft = 10;
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
      title: MyTextWidget(text: 'Mark Your Interest', color: const Color(0xFF424141), size: widget.screenSize.width/18, weight: FontWeight.bold),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextWidget(text: 'Thank you for showing interest in this car. The seller will contact you shortly if you click the intrested button to discuss the deal.', color: const Color(0xFF424141), size: widget.screenSize.width/30, weight: FontWeight.bold,maxline: true,),
          SizedBox(height: widget.screenSize.height/100,),
          MyTextWidget(text: 'Rs 199/- is charged for Marking Interest.', color: Colors.blueGrey, size: widget.screenSize.width/25, weight: FontWeight.bold,maxline: true,),         
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MyTextWidget(
                      text: 'Back',
                      color: Colors.white,
                      size: widget.screenSize.width / 30,
                      weight: FontWeight.bold),
                  SizedBox(
                    width: widget.screenSize.width / 35,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 14,
                    child: BlocBuilder<BuyScreenBloc, BuyScreenState>(
                      bloc: refreshTimerBlocObj,
                      builder: (context, state) {
                        return MyTextWidget(
                            text: secondsLeft.toString(),
                            color: Colors.black,
                            size: 15,
                            weight: FontWeight.w600);
                      },
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  // markUserInterest(
                  //     context: context,
                  //     isFromSearch: widget.isFromSearch,
                  //     car: widget.data);
                  // StripePaymentService.instance.makePayment();
                  UserData? userData  = await  fetchUserDetails();
                  User user = User(userName: userData!.userName, email: userData.email);
                  await StripeSubscriptionService.instance.createSubscription(user: user);
                },
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green)),
                child: MyTextWidget(
                    text: 'Mark as Intrested',
                    color: Colors.white,
                    size: widget.screenSize.width / 30,
                    weight: FontWeight.bold)
            ),
          ],
        )
      ],
    );
  }
}
