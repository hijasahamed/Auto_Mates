import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:flutter/material.dart';

class FavouriteContainer extends StatelessWidget {
  const FavouriteContainer({super.key,required this.screenSize,required this.profileScreenBloc});
  final Size screenSize;
  final ProfileScreenBloc profileScreenBloc;
  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Ink(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 195, 226, 239),
        borderRadius: BorderRadius.circular(10),
      ),
      height: screenSize.height/7,
      child: InkWell(
        onTap: () {
          profileScreenBloc.add(FavouriteConatinerClickedEvent());
        },
        child: Stack(
            children: [
              Positioned(
                left: 65,
                top: 30,
                child: Container(
                  height: screenSize.height/15,
                  width: screenSize.width/7,
                  decoration: const BoxDecoration(                           
                    image: DecorationImage(image: AssetImage('assets/images/favourite.png'),fit: BoxFit.cover)
                  ),
                ),
              ),
              const Positioned(
              bottom: 18,
              left: 43,
              child: MyTextWidget(text: "Favourite Cars", color: Color(0XFF424141), size: 15, weight: FontWeight.bold)
            ),
            ],
          ),           
      ),
    ),
  );
  }
}