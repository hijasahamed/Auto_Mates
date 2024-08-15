import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

paymentSuccessPage({screenSize, context,paidAmount,title}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black54,
    builder: (context) {
      return Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: screenSize.width / 4.5,
              backgroundColor: Colors.green,
              child: Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: screenSize.width / 6.5,
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height / 50,
            ),
            MyTextWidget(
                text: "payment Successfull",
                color: Colors.grey,
                size: screenSize.width / 25,
                weight: FontWeight.bold),
            SizedBox(
              height: screenSize.height / 100,
            ),
            MyTextWidget(
                text: "Amount Paid ₹$paidAmount /-",
                color: Colors.green,
                size: screenSize.width / 27,
                weight: FontWeight.bold),
            SizedBox(
              height: screenSize.height / 25,
            ),
            MyTextWidget(
              text: title,
              color: Colors.blueGrey,
              size: screenSize.width / 17,
              weight: FontWeight.bold,
              maxline: true,
              alignTextCenter: true,
            ),
          ],
        ),
      );
    },
  );
}
