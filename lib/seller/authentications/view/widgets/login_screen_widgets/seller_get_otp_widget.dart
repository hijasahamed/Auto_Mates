import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

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
  final GlobalKey formKey;
  final SellerAuthenticationBloc sellerAuthenticationBloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height / 3,
      width: screenSize.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.black12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const MyTextWidget(
                text: 'Enter Your Registerd Company Number To Login',
                color: Colors.white,
                size: 20,
                weight: FontWeight.bold),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: phoneNumber,
                    
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid phone number';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: const TextStyle(
                        color: Color(0xFF424141),
                        fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 86, 86, 86),
                          fontWeight: FontWeight.normal),
                      fillColor: Colors.white,
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
            ElevatedButton(
                onPressed: () {
                  sellerAuthenticationBloc
                      .add(SellerGetOtpButtonClickedEvent());
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
                    onPressed: () {
                      sellerAuthenticationBloc
                          .add(CreateCompanyButtonClickedEvent());
                    },
                    child: const MyTextWidget(
                        text: 'Create Company',
                        color: Colors.white,
                        size: 18,
                        weight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
