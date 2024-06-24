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
              // removeUserInterestAlertDialog(context: context, docId: data.id);
            showDialog(
            barrierDismissible: false,
            context: context, 
            builder: (context) => CustomAlertDialog(
              image: 'assets/images/logout.png',
              title: 'Logout',
              subtitle: 'Do you want to Logout from AutoMates',
              screenSize: screenSize,
              isSellerRemovingInterestedCar: true,
              interestedDataIdInSeller: data.id,              
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
