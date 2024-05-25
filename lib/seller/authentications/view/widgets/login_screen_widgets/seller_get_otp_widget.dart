import 'package:auto_mates/seller/authentications/controllers/functions.dart';
import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
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
              color: Colors.black87,
              size: 15,
              weight: FontWeight.bold),
          const MyTextWidget(
              text: 'to verify your account',
              color: Colors.black87,
              size: 15,
              weight: FontWeight.bold),
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
          Container(
            height: screenSize.height / 16,
            width: screenSize.width / 1.5,
            color: Colors.transparent,
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.redAccent,
              child: InkWell(
                  onTap: ()async {
                    if (phoneNumber.text == '') {
                      snackbarWidget(
                          'Please enter a valid phone number',
                          context,
                          Colors.blue,
                          Colors.white,
                          SnackBarBehavior.floating);
                    } else if (formKey.currentState!.validate()) {
                      await sellerPhoneVerification(
                          formkey: formKey,
                          context: context,
                          contryCode: countrryCode,
                          phoneNumber: phoneNumber.text,
                          screenSize: screenSize,
                          sellerAuthenticationBloc: sellerAuthenticationBloc);
                    }
                  },
                  child: const Center(
                    child: MyTextWidget(
                        text: 'Generate OTP',
                        color: Colors.white,
                        size: 17,
                        weight: FontWeight.bold),
                  )),
            ),
          ),
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
                    weight: FontWeight.bold),
                TextButton(
                    onPressed: () {
                      sellerAuthenticationBloc
                          .add(CreateCompanyButtonClickedEvent());
                    },
                    child: const MyTextWidget(
                        text: 'Click to create company',
                        color: Colors.blue,
                        size: 15,
                        weight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
