import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:auto_mates/seller/authentications/view/seller_login_screen.dart';
import 'package:auto_mates/seller/authentications/view/widgets/create_account_widgets/already_seller_login_widget.dart';
import 'package:auto_mates/seller/authentications/view/widgets/create_account_widgets/create_account_welcome_widget.dart';
import 'package:auto_mates/seller/authentications/view/widgets/create_account_widgets/create_button_widget.dart';
import 'package:auto_mates/seller/authentications/view/widgets/create_account_widgets/create_section_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCompanyScreen extends StatelessWidget {
  CreateCompanyScreen({super.key, required this.screenSize,required this.sellerAuthenticationBloc});
  final Size screenSize;
  final SellerAuthenticationBloc sellerAuthenticationBloc;
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final GlobalKey formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SellerAuthenticationBloc, SellerAuthenticationState>(
      bloc: sellerAuthenticationBloc,
      listener: (context, state) {
        if(state is AlreadyASellerLoginToYourAccountButtonClickedActionState){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
              SellerLoginScreen(screenSize: screenSize)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            height: screenSize.height,
            width: screenSize.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/seller login.png'),
                    fit: BoxFit.cover)),
            child: SafeArea(
                child: Container(
              color: Colors.black45,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenSize.height / 50,
                    ),
                    const CreateAccountWelcomeScreen(),
                    SizedBox(
                      height: screenSize.height / 15,
                    ),
                    CreateSectionWidget(
                      formKey: formKey,
                      phoneNumberController: phoneNumberController,
                      screenSize: screenSize,
                      companyNameController: companyNameController,
                      locationController: locationController,
                    ),
                    SizedBox(
                      height: screenSize.height / 15,
                    ),
                    CreateButtonWidget(
                      screenSize: screenSize,
                    ),
                    SizedBox(
                      height: screenSize.height / 50,
                    ),
                    AlreadyASellerLoginWidget(sellerAuthenticationBloc: sellerAuthenticationBloc,)
                  ],
                ),
              ),
            )),
          ),
        );
      },
    );
  }
}
