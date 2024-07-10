import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class PreviousEmptyScreen extends StatelessWidget {
  const PreviousEmptyScreen({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/previous_compare.webp'),
          )),
          child: Center(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(2)),
                  child: MyTextWidget(
                      text: ' No History ',
                      color: Colors.white,
                      size: screenSize.width / 28,
                      weight: FontWeight.bold))),
        ),
      ),
    );
  }
}
