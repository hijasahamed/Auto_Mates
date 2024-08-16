
import 'package:auto_mates/user/commonwidgets/custom_alertdialog/custom_alert_dialog.dart';
import 'package:flutter/material.dart';

class UserInterestedCarRemoveButton extends StatelessWidget {
  const UserInterestedCarRemoveButton({super.key, required this.data,required this.screenSize});
  final dynamic data;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context, 
                builder: (context) => CustomAlertDialog(
                  image: 'assets/images/bin.png',
                  title: 'Remove Interest',
                  subtitle: '''Do you want to remove the interest? This will be removed for the seller also. Note: Only 40 % of the Amount will be refunded in to AutoMates Coins if you remove the interest.''',
                  screenSize: screenSize,
                  isUsersInterestRemoving: true,
                  userInterestedData: data,              
                ),
              );  
            },
            icon: const Icon(
              Icons.clear,
              size: 20,
              color: Color.fromARGB(255, 74, 74, 74),
            )),
      ],
    );
  }
}
