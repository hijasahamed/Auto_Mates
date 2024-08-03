import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class AutoBackWidgetTitle extends StatelessWidget {
  const AutoBackWidgetTitle({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return MyTextWidget(
        text: 'Mark Your Interest',
        color: Colors.blueGrey,
        size: screenSize.width / 18,
        weight: FontWeight.bold);
  }
}
