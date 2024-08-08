import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class TollFreeNumber extends StatelessWidget {
  const TollFreeNumber({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        makeCall(context: context,mobileNumber: '7907721095');
      },
      child: Ink(
        height: screenSize.height / 7,
        width: screenSize.width,
        color: const Color.fromARGB(255, 245, 245, 245),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextWidget(
                  text: 'TOLL FREE NUMBER',
                  color: Colors.blueGrey,
                  size: screenSize.width / 27,
                  weight: FontWeight.w200),
              SizedBox(height: screenSize.height/150,),
              Row(
                children: [
                  const Icon(
                    Icons.phone,
                    color: Colors.blue,
                  ),
                  MyTextWidget(
                      text: '1800 2090 230',
                      color: Colors.blue,
                      size: screenSize.width / 28,
                      weight: FontWeight.bold),
                ],
              ),
              SizedBox(height: screenSize.height/150,),
              MyTextWidget(
                  text: ' Ask the Experts',
                  color: Colors.blueGrey,
                  size: screenSize.width / 35,
                  weight: FontWeight.w300),
            ],
          ),
        ),
      ),
    );
  }
}
