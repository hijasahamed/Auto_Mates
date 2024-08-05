import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/bottom_app_bar/interested_button/auto_back_widget/auto_back_widget.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AutoBackWidgetContent extends StatelessWidget {
  const AutoBackWidgetContent(
      {super.key, required this.screenSize, required this.checkBoxRefreshObj,required this.fillCheckedBoxAlertRefreshObj});
  final Size screenSize;
  final BuyScreenBloc checkBoxRefreshObj;
  final BuyScreenBloc fillCheckedBoxAlertRefreshObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyTextWidget(
          text:
              'Thank you for showing interest in this car. The seller will contact you shortly if you click the intrested button to discuss the deal.',
          color: Colors.blueGrey,
          size: screenSize.width / 30,
          weight: FontWeight.bold,
          maxline: true,
        ),
        SizedBox(
          height: screenSize.height / 100,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<BuyScreenBloc, BuyScreenState>(
              bloc: checkBoxRefreshObj,
              builder: (context, state) {
                return Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    isChecked = value ?? false;
                    fillCheckedBox = false;
                    checkBoxRefreshObj.add(CheckBoxRefreshEvent());
                    fillCheckedBoxAlertRefreshObj.add(FillCheckedBoxAlertRefreshEvent());
                  },
                );
              },
            ),
            Expanded(
              child: MyTextWidget(
                text:
                    'Rs 999/- is charged for Marking Interest. This amount is not refundable.Are you sure to mark interest?',
                color: const Color.fromARGB(255, 47, 47, 47),
                size: screenSize.width / 28,
                weight: FontWeight.bold,
                maxline: true,
              ),
            ),
          ],
        ),
        SizedBox(
          height: screenSize.height / 50,
        ),
        BlocBuilder<BuyScreenBloc, BuyScreenState>(
          bloc: fillCheckedBoxAlertRefreshObj,
          builder: (context, state) {
            return Visibility(
                visible: fillCheckedBox,
                child: MyTextWidget(
                    text: 'Fill the Terms & Conditions',
                    color: Colors.red,
                    size: screenSize.width / 30,
                    weight: FontWeight.w300));
          },
        )
      ],
    );
  }
}
