
import 'package:auto_mates/user/commonwidgets/custom_alertdialog/custom_alert_dialog.dart';
import 'package:flutter/material.dart';

class UserInterestedCarRemoveButton extends StatelessWidget {
  const UserInterestedCarRemoveButton({super.key, required this.data,required this.screenSize});
  final dynamic data;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {
              // profileScreenAlertMessage(context: context,interestedData: data,removeInterestMarked: true);
              showDialog(
                barrierDismissible: false,
                context: context, 
                builder: (context) => CustomAlertDialog(
                  image: 'assets/images/logout.png',
                  title: 'Remove Interest',
                  subtitle: 'Do you want to remove the interest? This will be removed for the seller also.',
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
