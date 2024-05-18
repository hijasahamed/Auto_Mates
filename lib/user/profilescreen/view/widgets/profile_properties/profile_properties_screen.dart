import 'package:auto_mates/user/profilescreen/view/widgets/profile_properties/containers_widgets/favourite_container.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/profile_properties/containers_widgets/logout_container.dart';
import 'package:flutter/material.dart';

class ProfilePropertiesScreen extends StatelessWidget {
  const ProfilePropertiesScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
               Expanded(
                  child: FavouriteContainer(screenSize: screenSize) 
                ),
                Expanded(
                  child: Container(
                    height: screenSize.height/7,  
                    margin: EdgeInsets.all(3),
                    color: Colors.red,
                  ),
                ),
            ],
          ),
          Row(
            children: [
               Expanded(
                  child: Container(
                    height: screenSize.height/7, 
                    margin: EdgeInsets.all(3),
                    color: Colors.red,
                  ),
                ),                
                Expanded(
                  child: LogoutContainer(screenSize: screenSize)
                ),
            ],
          ),
        ],
      ),
    );
  }
}