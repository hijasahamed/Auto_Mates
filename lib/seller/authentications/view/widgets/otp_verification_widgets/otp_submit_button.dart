import 'package:auto_mates/seller/authentications/controllers/functions.dart';
import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:auto_mates/seller/seller_appbar_bottombar/view/seller_appbar_bottombar_screen.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpSubmitButton extends StatelessWidget {
  const OtpSubmitButton({super.key, required this.verifyOtpBlocInstance,required this.sellerAuthenticationBloc});
  final SellerAuthenticationBloc verifyOtpBlocInstance;
  final SellerAuthenticationBloc sellerAuthenticationBloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => verifyOtpBlocInstance,
      child: BlocListener<SellerAuthenticationBloc,SellerAuthenticationState>(
        bloc: verifyOtpBlocInstance,
        listener: (context, state) {
          if(state is SubmitOtpClickedLoadingState){
            showDialog(
              context: context,
              barrierDismissible: false, 
              builder: (context) {
              return const Center(child: CircularProgressIndicator(color: Colors.blue,));
            },);
          }
          else if(state is SubmitOtpClickedStopLoadingState){
            Navigator.pop(context);
          }
          else if(state is SubmitOtpButtonClickedSuccessState){
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const Sellerappbarbottombar()),
              (Route<dynamic> route) => false,
            );
          }         
        },
        child: BlocBuilder<SellerAuthenticationBloc,SellerAuthenticationState>(
          bloc: verifyOtpBlocInstance,
          builder: (context, state) {
            return ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
                minimumSize: WidgetStatePropertyAll(Size(double.infinity, 55)),
              ),
              onPressed: () {
                sellerAuthenticationBloc
                    .add(SubmitOtpButtonClickedEvent(code: otpSmsCode));
              },
              child: const MyTextWidget(
                  text: 'Submit OTP',
                  color: Colors.white,
                  size: 20,
                  weight: FontWeight.bold));
          },
        ),
      ),
    );
  }
}



