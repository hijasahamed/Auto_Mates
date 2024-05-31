import 'package:auto_mates/seller/seller_profile_screen/controllers/functions.dart';
import 'package:flutter/material.dart';

class UserInterestCloseButton extends StatelessWidget {
  const UserInterestCloseButton({super.key, required this.data});
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(3),
          child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.red,
              child: IconButton(
                  onPressed: () {
                    removeUserInterestAlertDialog(
                        context: context, docId: data.id);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20,
                  ))),
        ),
      ],
    );
  }
}
