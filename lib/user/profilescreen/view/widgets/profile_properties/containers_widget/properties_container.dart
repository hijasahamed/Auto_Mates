
import 'package:auto_mates/user/commonwidgets/custom_alertdialog/custom_alert_dialog.dart';
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
  this.isCompareCar
  });
  final Size screenSize;
  final ProfileScreenBloc profileScreenBloc;
  final bool? isFavouriteCar;
  final bool? isEmiCalculator;
  final bool? isFavouriteSeller;
  final bool? isInterestedCar;
  final bool? isLogout;
  final bool? isCompareCar;
  @override
  Widget build(BuildContext context) {
  return Card(
    elevation: 5,
    shadowColor: Colors.grey,
    child: Ink(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 238, 238, 238),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.01)
      ),
      height: screenSize.height/7,
      child: InkWell(
        onTap: () {
          if(isFavouriteCar==true){
            profileScreenBloc.add(FavouriteConatinerClickedEvent());
          }
          if(isLogout==true){
            showDialog(
            barrierDismissible: false,
            context: context, 
            builder: (context) => CustomAlertDialog(
              image: 'assets/images/logout.png',
              title: 'Logout',
              subtitle: 'Do you want to Logout from AutoMates',
              screenSize: screenSize,
              isUserLogout: true,
              profileScreenBloc: profileScreenBloc,
            ),
          );
          }
          if(isInterestedCar==true){
            profileScreenBloc.add(InterestedCarConatinerClickedEvent());
          }
          if(isFavouriteSeller==true){
            profileScreenBloc.add(FavouriteSellerContainerClickedEvent());
          }
          if(isCompareCar==true){
            
          }
          if(isEmiCalculator==true){
            profileScreenBloc.add(EmiCalculatorConatinerClickedEvent());
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
                    : (isCompareCar==true)? const AssetImage('assets/images/compare.png')
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
                : (isCompareCar==true)?'Compare Car'
                : '' ,
              color: const Color(0xFF424141), size: 15, weight: FontWeight.bold),
            ],
          ),
      ),
    ),
  );
  }
}