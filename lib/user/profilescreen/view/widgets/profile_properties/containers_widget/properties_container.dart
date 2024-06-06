
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:flutter/material.dart';

class PropertiesContainer extends StatelessWidget {
  const PropertiesContainer({super.key,
  required this.screenSize,
  required this.profileScreenBloc,
  this.isInterestedCar,
  this.isFavouriteCar,
  this.isLogout,
  this.isEmiCalculator,
  this.isFavouriteSeller,
  });
  final Size screenSize;
  final ProfileScreenBloc profileScreenBloc;
  final bool? isFavouriteCar;
  final bool? isEmiCalculator;
  final bool? isFavouriteSeller;
  final bool? isInterestedCar;
  final bool? isLogout;
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
          if(isFavouriteCar==true){
            profileScreenBloc.add(FavouriteConatinerClickedEvent());
          }
          if(isLogout==true){
            profileScreenBloc.add(LogoutButtonClickedEvent());  
          }
          if(isInterestedCar==true){
            profileScreenBloc.add(InterestedCarConatinerClickedEvent());
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: screenSize.height/18,
                decoration: BoxDecoration(                           
                  image: DecorationImage(
                    image: (isFavouriteCar==true) ? const AssetImage('assets/images/favourite.png')
                    : (isEmiCalculator==true) ? const AssetImage('assets/images/calculator (1).png')
                    : (isFavouriteSeller==true) ? const AssetImage('assets/images/quality.png')
                    : (isLogout==true) ? const AssetImage('assets/images/logout.png')
                    : (isInterestedCar==true)? const AssetImage('assets/images/car-wash.png')
                    : const AssetImage('assets/images/placeholder.jpg')
                  )
                ),
              ),
              MyTextWidget(
                text: (isFavouriteCar==true) ? 'Favourite Cars'
                : (isEmiCalculator==true) ? 'EMI Calculator'
                : (isFavouriteSeller==true) ? "Favourite Seller"
                : (isLogout==true) ? 'Logout '
                : (isInterestedCar==true) ? 'Interested Car'
                : '' ,
              color: const Color(0XFF424141), size: 15, weight: FontWeight.bold),
            ],
          ),
      ),
    ),
  );
  }
}