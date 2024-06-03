import 'package:auto_mates/seller/seller_profile_screen/controllers/functions.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:flutter/material.dart';

class UserInterestedCarRemoveButton extends StatelessWidget {
  const UserInterestedCarRemoveButton({super.key, required this.data});
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {
              profileScreenAlertMessage(context: context,interestedData: data,removeInterestMarked: true);
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
