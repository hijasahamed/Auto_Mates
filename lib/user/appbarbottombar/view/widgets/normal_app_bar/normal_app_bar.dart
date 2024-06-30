import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/all_cars_to_sell/pop_up_button/popup_menu_button_widget.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/app_bar_gradient_color.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/filter_screen.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/emicalculator/controllers/function.dart';
import 'package:auto_mates/user/emicalculator/view/widgets/emi_screen_opening_text_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:flutter/material.dart';

class NormalAppBar extends StatelessWidget {
  const NormalAppBar(
      {super.key,
      required this.title,
      this.isFromSeller,
      this.isFromCarDetailsAppBar,
      this.sellerHomeScreenBloc,
      this.screenSize,
      this.data,
      this.isFromFilterResultPage,
      this.isFromFilterPage,
      this.isFromEmi,
      this.isCompare,
      this.compareCarsBlocInstance,this.previousComparisonBlocInstance
      });
  final String title;
  final bool? isFromSeller;
  final bool? isFromCarDetailsAppBar;
  final SellerHomeScreenBloc? sellerHomeScreenBloc;
  final Size? screenSize;
  final dynamic data;
  final bool? isFromFilterResultPage;
  final bool? isFromFilterPage;
  final bool? isFromEmi;
  final bool? isCompare;
  final ProfileScreenBloc? compareCarsBlocInstance;
  final ProfileScreenBloc? previousComparisonBlocInstance;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      flexibleSpace:
          (isFromFilterResultPage == true) ? null : (isFromEmi==true) ? const EmiScreenAppBar() : const AppBarGradientColor(),
      leading: IconButton(
          onPressed: () {
            if (isFromFilterResultPage == true) {
              filterdCarList.clear();
              selectedCarFilterdList.clear();
              Navigator.pop(context);
            }
            else if(isFromFilterPage==true){
              selectedCarFilterdList.clear();
              filterdCarList.clear();
              Navigator.pop(context);
            } 
            else if(isFromEmi==true){
              loanAmount=0;
              tenure=0;
              interest=0;
              Navigator.pop(context);
            }
            else if(isCompare==true){
              previousComparisonList=[];
              previousComparisonList=[...carForComparing1,...carForComparing2];
              carForComparing1.clear();
              carForComparing2.clear();
              compareCarsBlocInstance!.add(CompareCarScreenRefreshEvent());
              previousComparisonBlocInstance!.add(PreviousCompareCarScreenRefreshEvent());
              Navigator.pop(context);
            }
            else {
              Navigator.pop(context);
            }
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color:
                (isFromFilterResultPage == true) ? Colors.grey : Colors.white,
          )),
      title: MyTextWidget(
          text: title,
          color: (isFromFilterResultPage == true) ? Colors.grey : Colors.white,
          size: 19,
          weight: FontWeight.bold),
      centerTitle: false,
      actions: [
        (isFromSeller == true)
            ? PopupMenuButtonWidget(
                screenSize: screenSize,
                data: data,
                sellerHomeScreenBloc: sellerHomeScreenBloc,
                isFromCarDetailsAppBar: isFromCarDetailsAppBar,
              )
            : const SizedBox()
      ],
    );
  }
}

class EmiScreenAppBar extends StatelessWidget {
  const EmiScreenAppBar({super.key,});
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(     
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60))
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: EmiScreenOpeningTextWidget(screenSize: screenSize),
        )
      ),
    );
  }
}