import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/commonwidgets/custom_alertdialog/custom_alert_dialog.dart';
import 'package:flutter/material.dart';

class FavouriteSellerRemoveButton extends StatelessWidget {
  const FavouriteSellerRemoveButton(
      {super.key, required this.data, required this.screenSize});
  final dynamic data;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {              
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => CustomAlertDialog(
                  image: 'assets/images/bin.png',
                  title: 'Remove Seller',
                  subtitle: 'Do you want to remove this seller from favourites',
                  screenSize: screenSize,
                  removeFavSeller: true,
                  favSellerData: data,
                ),
              );
            },
            icon: const Icon(
              Icons.clear_outlined,
              color: Colors.black,
              size: 20,
            ))
      ],
    );
  }
}
