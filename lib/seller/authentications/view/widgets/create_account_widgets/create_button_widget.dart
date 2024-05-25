import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class CreateButtonWidget extends StatelessWidget {
  const CreateButtonWidget({super.key, required this.screenSize,required this.sellerAuthenticationBloc});
  final Size screenSize;
  final SellerAuthenticationBloc sellerAuthenticationBloc;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height / 18,
      width: screenSize.width / 1.5,
      child: Material(
        color: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () {
            sellerAuthenticationBloc.add(CreateCompanyButtonClickedEvent());
          },
          child: const Center(
              child: MyTextWidget(
                  text: 'Create Company',
                  color: Colors.white,
                  size: 16,
                  weight: FontWeight.bold)),
        ),
      ),
    );
  }
}
