import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:auto_mates/seller/authentications/view/create_company_screen.dart';
import 'package:auto_mates/seller/authentications/view/widgets/login_screen_widgets/seller_login_widget.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SellerLoginScreen extends StatefulWidget {
  const SellerLoginScreen({super.key, required this.screenSize});
  final Size screenSize;

  @override
  State<SellerLoginScreen> createState() => _SellerLoginScreenState();
}

class _SellerLoginScreenState extends State<SellerLoginScreen> {
  final GlobalKey formKey = GlobalKey();

  final TextEditingController companyName = TextEditingController();

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
    return BlocConsumer<SellerAuthenticationBloc, SellerAuthenticationState>(
      bloc: sellerAuthenticationBloc,
      listener: (context, state) {
        if (state is CreateCompanyButtonClickedActionState) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const CreateCompanyScreen()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (SellerAuthenticationLoadingState):
            return Scaffold(
              backgroundColor: const Color(0xFFDBEDF5),
              body:Center(
                child: LottieBuilder.asset('assets/animations/loading lines.json',height: 100,width: 100,)
              ),
            );
          case const (SellerAuthenticationLoadedSuccessState):
            return Scaffold(
                resizeToAvoidBottomInset: false,
                body: Container(
                    height: widget.screenSize.height,
                    width: widget.screenSize.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/seller login.png'),
                            fit: BoxFit.cover)),
                    child: SafeArea(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const MyTextWidget(
                              text: 'Auto Mates',
                              color: Colors.black,
                              size: 50,
                              weight: FontWeight.bold),
                          SellerLoginWidget(
                            screenSize: widget.screenSize,
                            companyName: companyName,
                            phoneNumber: phoneNumber,
                            formKey: formKey,
                            sellerAuthenticationBloc: sellerAuthenticationBloc,
                          ),
                          const ColoredBox(
                            color: Colors.white60,
                            child: MyTextWidget(
                                text:
                                    'Sell your car fast & free. Eager used car buyers visit us monthly. Get started in just a few steps!',
                                color: Colors.black,
                                size: 24,
                                weight: FontWeight.bold),
                          )
                        ],
                      ),
                    ))));
          default:
            return const SizedBox();
        }
      },
    );
  }
}
