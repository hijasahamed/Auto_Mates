import 'package:auto_mates/seller/seller_profile_screen/controllers/functions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class UserInterestedNotify extends StatelessWidget {
  const UserInterestedNotify({super.key, required this.sellerData});
  final dynamic sellerData;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getUsersInterestsWithSellerId(sellerData.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink();
        }
        if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          final data=snapshot.data!.docs;
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.green,
              child: MyTextWidget(text: data.length.toString(), color: Colors.white, size: 12, weight: FontWeight.w400),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
