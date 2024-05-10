import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:auto_mates/user/authentications/view/widgets/signup_screen_widgets/text_form_widget.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

class SellerLoginWidget extends StatelessWidget {
  const SellerLoginWidget(
      {super.key,
      required this.screenSize,
      required this.companyName,
      required this.phoneNumber,
      required this.formKey,
      required this.sellerAuthenticationBloc,
      });
  final Size screenSize;
  final TextEditingController companyName;
  final TextEditingController phoneNumber;
  final GlobalKey formKey;
  final SellerAuthenticationBloc sellerAuthenticationBloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height / 3,
      width: screenSize.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const MyTextWidget(text: 'Enter Your Registerd Company Number To Login', color: Colors.white, size: 20, weight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormWidget(
                  text: 'Phone Number',
                  controller: phoneNumber,
                  warning: 'Enter Valid Phone Number',
                  obscure: false,
                  keyBoardType: TextInputType.phone,
                  textCapitalization: TextCapitalization.none),
            ),
            ElevatedButton(
                onPressed: () {
                  sellerAuthenticationBloc.add(SellerLoginButtonClickedEvent());
                },
                child: const MyTextWidget(
                    text: 'Get OTP',
                    color: Colors.black,
                    size: 18,
                    weight: FontWeight.bold)),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: (){
                      sellerAuthenticationBloc.add(CreateCompanyButtonClickedEvent());
                    }, 
                    child: const MyTextWidget(text: 'Create Company', color: Colors.white, size: 18, weight: FontWeight.bold)
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
