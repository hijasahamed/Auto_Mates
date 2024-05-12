import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

class AlreadyASellerLoginWidget extends StatelessWidget {
  const AlreadyASellerLoginWidget({super.key,required this.sellerAuthenticationBloc});
  final SellerAuthenticationBloc sellerAuthenticationBloc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const MyTextWidget(text: 'Already a Seller?', color: Color.fromARGB(255, 132, 132, 132), size: 15, weight: FontWeight.bold),
          TextButton(
            onPressed: () {
              sellerAuthenticationBloc.add(AlreadyASellerLoginToYourAccountButtonClickedEvent());
            }, 
            child: const MyTextWidget(text: 'Login to your Account', color: Colors.blue, size: 15, weight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}