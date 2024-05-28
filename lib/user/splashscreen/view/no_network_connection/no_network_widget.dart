import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/splashscreen/view/bloc/splash_bloc.dart';
import 'package:auto_mates/user/splashscreen/view/splash_screen/splash_screen.dart';
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
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          body: SafeArea(
            child: SizedBox(
              height: screenSize.height,
              width: screenSize.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [                    
                    Container(
                      height: screenSize.height/2.8,
                      width: screenSize.width/1.1,
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/no net.webp'),fit: BoxFit.cover,filterQuality: FilterQuality.high)
                      ),
                    ),
                    const MyTextWidget(
                        text: 'Whoops! Connection lost',
                        color: Color(0xFF424141),
                        size: 23,
                        weight: FontWeight.w500),
                    const MyTextWidget(
                        text: 'It seems something is wrong with your connection',
                        color: Colors.grey,
                        size: 15,
                        weight: FontWeight.w600),
                    const MyTextWidget(
                        text: 'Please connect to the internet and try again',
                        color: Colors.grey,
                        size: 15,
                        weight: FontWeight.w600),
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
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: MyTextWidget(
                                text: 'Try Again',
                                color: Colors.white,
                                size: 17,
                                weight: FontWeight.bold)),
                      ),
                    )
                  ]),
            ),
          ),
        );
      },
    );
  }
}
