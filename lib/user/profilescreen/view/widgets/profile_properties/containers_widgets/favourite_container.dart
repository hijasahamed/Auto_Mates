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
        image: const DecorationImage(image: AssetImage('assets/images/fav section.jpg'),fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey)
      ),
      height: screenSize.height/7,
      child: InkWell(
        onTap: () {
          profileScreenBloc.add(FavouriteConatinerClickedEvent());
        },           
      ),
    ),
  );
  }
}