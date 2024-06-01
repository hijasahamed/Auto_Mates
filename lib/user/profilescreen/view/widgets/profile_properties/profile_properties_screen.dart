import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/profile_properties/containers_widget/properties_container.dart';
import 'package:flutter/material.dart';

class ProfilePropertiesScreen extends StatelessWidget {
  const ProfilePropertiesScreen({super.key,required this.screenSize,required this.profileScreenBloc});
  final Size screenSize;
  final ProfileScreenBloc profileScreenBloc;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
             Expanded(
                child: PropertiesContainer(screenSize: screenSize,profileScreenBloc: profileScreenBloc,isFavouriteCar: true,) 
              ),
              Expanded(
                child: PropertiesContainer(screenSize: screenSize,profileScreenBloc: profileScreenBloc,isEmiCalculator: true,) 
              ),
          ],
        ),
        Row(
          children: [
             Expanded(
                child:PropertiesContainer(screenSize: screenSize,profileScreenBloc: profileScreenBloc,isFavouriteSeller: true,) 
              ),
              Expanded(                
                child: PropertiesContainer(screenSize: screenSize, profileScreenBloc: profileScreenBloc,isInterestedCar: true,)
              ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: PropertiesContainer(screenSize: screenSize,profileScreenBloc: profileScreenBloc,isLogout: true,)
            )
          ],
        )
      ],
    );
  }
}