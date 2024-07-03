import 'package:auto_mates/user/commonwidgets/custom_alertdialog/custom_alert_dialog.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:flutter/material.dart';

class UserFavouriteRemoveButton extends StatelessWidget {
  const UserFavouriteRemoveButton(
      {super.key, required this.screenSize, required this.data});
  final Size screenSize;
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: const Color(0xFFDBEDF5),
      onTap: () {
        removeFavoriteCar(context: context,docId: data.id);        
      },
      child: Ink(
        height: screenSize.height / 20,
        width: screenSize.width / 1.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.red,
        ),
        child: const Center(
          child: Text(
            'Remove Favourite',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
