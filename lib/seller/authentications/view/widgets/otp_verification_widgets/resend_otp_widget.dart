import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class ResendOtpWidget extends StatelessWidget {
  const ResendOtpWidget({super.key,required this.phoneNumber,required this.sellerAuthenticationBloc});
  final String phoneNumber;
  final SellerAuthenticationBloc sellerAuthenticationBloc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              sellerAuthenticationBloc.add(ResendOtpButtonClickedEvent());
            }, 
            child: const MyTextWidget(text: 'Resend OTP', color: Colors.black87, size: 17, weight: FontWeight.w500),
          ),
        ],
      ),
      
    );
  }
}