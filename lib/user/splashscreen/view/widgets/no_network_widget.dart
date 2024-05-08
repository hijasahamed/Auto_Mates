import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:auto_mates/user/splashscreen/view/bloc/splash_bloc.dart';
import 'package:auto_mates/user/splashscreen/view/splash_screen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoNetworkWidget extends StatelessWidget {
  const NoNetworkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashBloc splashBloc = SplashBloc();
    final screenSize = MediaQuery.of(context).size;
    return BlocConsumer<SplashBloc, SplashState>(
      bloc: splashBloc,
      listener: (context, state) {
        if(state is RefreshButtonClickedActionState){
           Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const SplashScreen(),
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFDBEDF5),
          body: SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    EvaIcons.wifiOff,
                    size: 100,
                    color: Colors.red,
                  ),
                  const MyTextWidget(
                      text: 'Ooops!',
                      color: Colors.black,
                      size: 30,
                      weight: FontWeight.w500),
                  const MyTextWidget(
                      text: 'No internet connection found',
                      color: Colors.grey,
                      size: 20,
                      weight: FontWeight.w400),
                  const MyTextWidget(
                      text: 'Check your connection',
                      color: Colors.grey,
                      size: 21,
                      weight: FontWeight.w400),
                  SizedBox(
                    height: screenSize.height / 50,
                  ),
                  InkWell(
                    onTap: () {
                      splashBloc.add(RefreshButtonClickedEvent());
                    },
                    child: Ink(
                      height: screenSize.height / 20,
                      width: screenSize.width / 2,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                          child: MyTextWidget(
                              text: 'Refresh',
                              color: Colors.white,
                              size: 20,
                              weight: FontWeight.bold)),
                    ),
                  )
                ]),
          ),
        );
      },
    );
  }
}
