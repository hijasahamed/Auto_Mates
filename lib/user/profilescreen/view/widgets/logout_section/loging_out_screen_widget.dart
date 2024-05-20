import 'package:auto_mates/seller/seller_profile_screen/controllers/functions.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LogingOutScreenWidget extends StatefulWidget {
  const LogingOutScreenWidget({super.key,required this.screenSize,required this.seller});
  final Size screenSize;
  final bool seller;
  @override
  State<LogingOutScreenWidget> createState() => _LogingOutScreenWidgetState();
}

class _LogingOutScreenWidgetState extends State<LogingOutScreenWidget> {
  @override
  void initState(){
    if(widget.seller==true){
    sellerLogout();
    }else{
    confirmUserLogout(context);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDBEDF5),
      body: SizedBox(
        height: widget.screenSize.height,
        width: widget.screenSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              'assets/animations/loading_animation.json',
              height: widget.screenSize.height / 10,
              width: widget.screenSize.width / 4,
              repeat: true,
            ),
            const MyTextWidget(
              text: 'Loging Out',
              color: Colors.red,
              size: 20,
              weight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}