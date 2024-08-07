import 'package:auto_mates/seller/authentications/controllers/functions.dart';
import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:auto_mates/seller/authentications/view/seller_login_screen.dart';
import 'package:auto_mates/seller/authentications/view/widgets/create_account_widgets/already_seller_login_widget.dart';
import 'package:auto_mates/seller/authentications/view/widgets/create_account_widgets/create_account_welcome_widget.dart';
import 'package:auto_mates/seller/authentications/view/widgets/create_account_widgets/create_button_widget.dart';
import 'package:auto_mates/seller/authentications/view/widgets/create_account_widgets/create_section_widgets.dart';
import 'package:auto_mates/seller/authentications/view/widgets/create_account_widgets/seller_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCompanyScreen extends StatelessWidget {
  CreateCompanyScreen(
      {super.key,
      required this.screenSize,
      required this.sellerAuthenticationBloc});
  final Size screenSize;
  final SellerAuthenticationBloc sellerAuthenticationBloc;
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final GlobalKey<FormState> sellerSignupFormkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SellerAuthenticationBloc createCompanyBlocInstance =SellerAuthenticationBloc();
    return BlocConsumer<SellerAuthenticationBloc, SellerAuthenticationState>(
      bloc: sellerAuthenticationBloc,
      listener: (context, state) {
        if (state is AlreadyASellerLoginToYourAccountButtonClickedActionState) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => SellerLoginScreen()));
        }
        if (state is CreateCompanyButtonClickedActionState) {
          createSellerAccount(
              companyName: companyNameController.text,
              location: locationController.text,
              phoneNumber: phoneNumberController.text,
              context: context,
              sellerSignupFormkey: sellerSignupFormkey,
              sellerAuthenticationBloc: sellerAuthenticationBloc,
              createCompanyBlocInstance: createCompanyBlocInstance,
              screenSize: screenSize);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CreateAccountWelcomeScreen(
                    screenSize: screenSize,
                  ),
                  SellerProfile(screenSize: screenSize,),
                  CreateSectionWidget(
                    sellerSignupFormkey: sellerSignupFormkey,
                    phoneNumberController: phoneNumberController,
                    screenSize: screenSize,
                    companyNameController: companyNameController,
                    locationController: locationController,
                  ),
                  CreateButtonWidget(
                    screenSize: screenSize,
                    sellerAuthenticationBloc: sellerAuthenticationBloc,
                    createCompanyBlocInstance: createCompanyBlocInstance,
                  ),
                  SizedBox(
                    height: screenSize.height / 50,
                  ),
                  AlreadyASellerLoginWidget(
                    sellerAuthenticationBloc: sellerAuthenticationBloc,
                  )
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
