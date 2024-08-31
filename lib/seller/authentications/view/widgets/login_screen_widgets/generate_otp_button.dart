import 'package:auto_mates/seller/authentications/controllers/functions.dart';
import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerateOtpButton extends StatelessWidget {
  const GenerateOtpButton({
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
    return BlocConsumer<SellerAuthenticationBloc, SellerAuthenticationState>(
      bloc: sellerAuthenticationBloc,
      listener: (context, state) {
        if (state is GetOtpClickedLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.blue,
              ));
            },
          );
        }
        else if(state is GetOtpClickedStopLoadingState){
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Container(
          height: screenSize.height / 16,
          width: screenSize.width / 1.5,
          color: Colors.transparent,
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.green,
            child: BlocBuilder<SellerAuthenticationBloc, SellerAuthenticationState>(
              bloc: sellerAuthenticationBloc,
              builder: (context, state) {
                return InkWell(
                    onTap: () async {
                      if (phoneNumber.text == '' ||
                          phoneNumber.text.length != 10) {
                        snackbarWidget(
                            'Please enter a valid phone number',
                            context,
                            Colors.red,
                            Colors.white,
                            SnackBarBehavior.floating);
                      } else if (formKey.currentState!.validate()) {
                        sellerAuthenticationBloc.add(GetOtpClickedLoadingEvent());
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
                    ));
              },
            ),
          ),
        );
      },
    );
  }
}
