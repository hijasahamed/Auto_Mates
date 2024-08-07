import 'package:auto_mates/user/commonwidgets/custom_alertdialog/custom_alert_dialog.dart';
import 'package:flutter/material.dart';

class UserInterestCloseButton extends StatelessWidget {
  const UserInterestCloseButton({super.key, required this.data,required this.screenSize});
  final dynamic data;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {
            showDialog(
            barrierDismissible: false,
            context: context, 
            builder: (context) => CustomAlertDialog(
              image: 'assets/images/bin.png',
              title: 'Remove Interest',
              subtitle: 'Do you want to remove the interest? This will be removed for the client also.',
              screenSize: screenSize,
              isSellerRemovingInterestedCar: true,
              interestedDataIdInSeller: data,              
            ),
          );
            },
            icon: const Icon(
              Icons.close,
              color: Color.fromARGB(255, 89, 89, 89),
              size: 20,
            )),
      ],
    );
  }
}
