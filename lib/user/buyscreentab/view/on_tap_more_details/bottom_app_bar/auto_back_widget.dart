import 'dart:async';

import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
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
      title: const Text(
        'Mark Your Interest',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF424141)),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Thank you for showing interest in this car. The seller will contact you shortly if you click the intrested button to discuss the deal.',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
          SizedBox(
            height: widget.screenSize.height / 50,
          ),
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
                onPressed: () {
                  markUserInterest(
                      context: context,
                      isFromSearch: widget.isFromSearch,
                      car: widget.data);
                },
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green)),
                child: MyTextWidget(
                    text: 'Mark as Intrested',
                    color: Colors.white,
                    size: widget.screenSize.width / 30,
                    weight: FontWeight.bold)),
          ],
        )
      ],
    );
  }
}
