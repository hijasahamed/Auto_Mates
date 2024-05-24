import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';

import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:flutter/material.dart';

class LogoutContainer extends StatelessWidget {
  const LogoutContainer({super.key,required this.screenSize,required this.profileScreenBloc});
  final Size screenSize;
  final ProfileScreenBloc profileScreenBloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height/7, 
      margin: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: const Color.fromARGB(255, 195, 226, 239),
        child: InkWell(
          onTap: (){            
            profileScreenBloc.add(LogoutButtonClickedEvent());            
          },
          child: Stack(
            children: [
              Positioned(
                left: 77,
                top: 30,
                child: Container(
                  height: screenSize.height/18,
                  width: screenSize.width/9,
                  decoration: const BoxDecoration(                           
                    image: DecorationImage(image: AssetImage('assets/images/logout.png'),fit: BoxFit.cover)
                  ),
                ),
              ),
              const Positioned(
              bottom: 18,
              left: 73,
              child: MyTextWidget(text: "Logout", color: Color(0XFF424141), size: 15, weight: FontWeight.bold)
            ),
            ],
          ),
        ),
      ),
    );
  }
}