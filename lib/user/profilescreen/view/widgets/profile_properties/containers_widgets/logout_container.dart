import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
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
        color: Colors.red,
        child: InkWell(
          onTap: (){            
            profileScreenBloc.add(LogoutButtonClickedEvent());
          },
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: screenSize.height/18,
                  width: screenSize.width/9,
                  decoration: const BoxDecoration(                           
                    image: DecorationImage(image: AssetImage('assets/images/logout.png'),fit: BoxFit.cover)
                  ),
                ),
              ),
              const Positioned(
              bottom: 0,
              left: 63,
              child: MyTextWidget(text: "Logout", color: Colors.white, size: 20, weight: FontWeight.bold)
            ),
            ],
          ),
        ),
      ),
    );
  }
}