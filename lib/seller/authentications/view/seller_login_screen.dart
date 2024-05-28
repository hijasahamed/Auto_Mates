import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:auto_mates/seller/authentications/view/create_company_screen.dart';
import 'package:auto_mates/seller/authentications/view/widgets/login_screen_widgets/seller_get_otp_widget.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SellerLoginScreen extends StatefulWidget {
  const SellerLoginScreen({
    super.key,
  });

  @override
  State<SellerLoginScreen> createState() => _SellerLoginScreenState();
}

class _SellerLoginScreenState extends State<SellerLoginScreen> {
  final GlobalKey<FormState> sellerFormKey = GlobalKey<FormState>();

  final TextEditingController phoneNumber = TextEditingController();

  final SellerAuthenticationBloc sellerAuthenticationBloc =
      SellerAuthenticationBloc();

  @override
  void initState() {
    sellerAuthenticationBloc.add(SellerAuthenticationInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocConsumer<SellerAuthenticationBloc, SellerAuthenticationState>(
      bloc: sellerAuthenticationBloc,
      listener: (context, state) {
        if (state is CreateCompanyButtonClickedActionState) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => CreateCompanyScreen(
                    screenSize: screenSize,
                    sellerAuthenticationBloc: sellerAuthenticationBloc,
                  )));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (SellerAuthenticationLoadingState):
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              body: Center(
                  child: LottieBuilder.asset(
                'assets/animations/loading_animation.json',
                height: screenSize.height / 10,
                width: screenSize.width / 5,
                repeat: true,
              )),
            );
          case const (SellerAuthenticationLoadedSuccessState):
            return Scaffold(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                resizeToAvoidBottomInset: false,
                body: SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: screenSize.height / 3.3,
                        width: screenSize.width / 2,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/enter number.webp'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const MyTextWidget(
                          text: 'Phone Verification',
                          color: Colors.black,
                          size: 25,
                          weight: FontWeight.bold),
                      SizedBox(
                        height: screenSize.height / 70,
                      ),
                      SellerGetOtpWidget(
                        screenSize: screenSize,
                        phoneNumber: phoneNumber,
                        formKey: sellerFormKey,
                        sellerAuthenticationBloc: sellerAuthenticationBloc,
                      ),
                    ],
                  ),
                )));
          default:
            return const SizedBox();
        }
      },
    );
  }
}
