import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

class AlreadyASellerLoginWidget extends StatelessWidget {
  const AlreadyASellerLoginWidget({super.key,required this.sellerAuthenticationBloc});
  final SellerAuthenticationBloc sellerAuthenticationBloc;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const MyTextWidget(text: 'Already a Seller?', color: Colors.white, size: 15, weight: FontWeight.bold),
        TextButton(
          onPressed: () {
            sellerAuthenticationBloc.add(AlreadyASellerLoginToYourAccountButtonClickedEvent());
          }, 
          child: const MyTextWidget(text: 'Login to your Account', color: Colors.white, size: 15, weight: FontWeight.bold),
        )
      ],
    );
  }
}