import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateButtonWidget extends StatelessWidget {
  const CreateButtonWidget(
      {super.key,
      required this.screenSize,
      required this.sellerAuthenticationBloc,
      required this.createCompanyBlocInstance
      });
  final Size screenSize;
  final SellerAuthenticationBloc sellerAuthenticationBloc;
  final SellerAuthenticationBloc createCompanyBlocInstance;
  @override
  Widget build(BuildContext context) {    
    return BlocConsumer<SellerAuthenticationBloc, SellerAuthenticationState>(
      bloc: createCompanyBlocInstance,
      listener: (context, state) {
        if(state is CreateCompanyButtonLoadingState){
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
        else if(state is CreateCompanyButtonStopLoadingState){
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: screenSize.height / 18,
          width: screenSize.width / 1.5,
          child: Material(
            color: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              onTap: () {
                createCompanyBlocInstance.add(CreateCompanyButtonLoadingEvent());
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
      },
    );
  }
}
