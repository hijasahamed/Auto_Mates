import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:flutter/material.dart';

class FavouriteSellerContainer extends StatelessWidget {
  const FavouriteSellerContainer({super.key,required this.screenSize,required this.profileScreenBloc});
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
          
        },
        child: Stack(
            children: [
              Positioned(
                left: 73,
                top: 35,
                child: Container(
                  height: screenSize.height/18,
                  width: screenSize.width/9,
                  decoration: const BoxDecoration(                           
                    image: DecorationImage(image: AssetImage('assets/images/quality.png'),fit: BoxFit.cover)
                  ),
                ),
              ),
              const Positioned(
              bottom: 18,
              left: 40,
              child: MyTextWidget(text: "Favourite Seller", color: Color(0XFF424141), size: 15, weight: FontWeight.bold)
            ),
            ],
          ),
      ),
    ),
  );
  }
}