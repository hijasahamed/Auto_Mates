import 'package:auto_mates/user/commonwidgets/custom_alertdialog/custom_alert_dialog.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class ContactSellerButton extends StatelessWidget {
  const ContactSellerButton(
      {super.key, required this.screenSize, required this.data});
  final Size screenSize;
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.green)),
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => CustomAlertDialog(
              image: 'assets/images/telephone (2).png',
              title: 'Call The Seller',
              subtitle: 'Do you want to call the seller ${data.companyName}',
              screenSize: screenSize,
              isSellerCalling: true,
              sellerData: data,
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.call,
              color: Colors.white,
              size: 15,
            ),
            SizedBox(
              width: screenSize.width / 75,
            ),
            const MyTextWidget(
                text: 'Contact Seller',
                color: Colors.white,
                size: 12,
                weight: FontWeight.bold),
          ],
        ));
  }
}
