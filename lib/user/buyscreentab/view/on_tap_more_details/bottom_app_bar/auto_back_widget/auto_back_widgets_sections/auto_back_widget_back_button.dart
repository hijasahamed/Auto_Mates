import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AutoBackWidgetBackButton extends StatelessWidget {
  const AutoBackWidgetBackButton(
      {super.key,
      required this.refreshTimerBlocObj,
      required this.screenSize,
      required this.secondsLeft});
  final Size screenSize;
  final BuyScreenBloc refreshTimerBlocObj;
  final int secondsLeft;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
              size: screenSize.width / 30,
              weight: FontWeight.bold),
          SizedBox(
            width: screenSize.width / 35,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 14,
            child: MyTextWidget(
                text: secondsLeft.toString(),
                color: Colors.black,
                size: screenSize.width / 35,
                weight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
