import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:auto_mates/seller/authentications/view/widgets/login_screen_widgets/generate_otp_button.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SellerGetOtpWidget extends StatelessWidget {
  const SellerGetOtpWidget({
    super.key,
    required this.screenSize,
    required this.phoneNumber,
    required this.formKey,
    required this.sellerAuthenticationBloc,
  });
  final Size screenSize;
  final TextEditingController phoneNumber;
  final GlobalKey<FormState> formKey;
  final SellerAuthenticationBloc sellerAuthenticationBloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height / 2.7,
      width: screenSize.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const MyTextWidget(
              text: 'Enter your registerd company number',
              color: Color.fromARGB(221, 58, 58, 58),
              size: 15,
              weight: FontWeight.w500),
          const MyTextWidget(
              text: 'to verify your account',
              color: Color.fromARGB(221, 58, 58, 58),
              size: 15,
              weight: FontWeight.w500),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: formKey,
                child: IntlPhoneField(
                  controller: phoneNumber,
                  initialCountryCode: 'IN',
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                      color: Color(0xFF424141), fontWeight: FontWeight.normal),
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 86, 86, 86),
                        fontWeight: FontWeight.normal),
                    fillColor: const Color.fromARGB(175, 231, 231, 231),
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              )),
              const Spacer(),
          GenerateOtpButton(screenSize: screenSize, phoneNumber: phoneNumber, formKey: formKey, sellerAuthenticationBloc: sellerAuthenticationBloc),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MyTextWidget(
                    text: 'New to AutoMates?',
                    color: Color.fromARGB(255, 114, 114, 114),
                    size: 15,
                    weight: FontWeight.w400),
                TextButton(
                    onPressed: () {
                      sellerAuthenticationBloc
                          .add(CreateCompanyButtonClickedEvent());
                    },
                    child: const MyTextWidget(
                        text: 'Click to create company',
                        color: Colors.blue,
                        size: 15,
                        weight: FontWeight.w500)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
