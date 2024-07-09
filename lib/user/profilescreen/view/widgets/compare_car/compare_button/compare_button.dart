

import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/compare_car/compared_screen/car_compared_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompareButton extends StatelessWidget {
  const CompareButton({super.key, required this.screenSize,required this.compareCarsBlocInstance,required this.previousComparisonBlocInstance});
  final Size screenSize;
  final ProfileScreenBloc compareCarsBlocInstance;
  final ProfileScreenBloc previousComparisonBlocInstance;
  @override
  Widget build(BuildContext context) {
    final ProfileScreenBloc compareCarsButtonBlocInstance = ProfileScreenBloc();
    return BlocConsumer<ProfileScreenBloc, ProfileScreenState>(
      bloc: compareCarsButtonBlocInstance,
      listener: (context, state) {
        if (state is NavigateToComparedScreenState) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CarComparedScreen(screenSize: screenSize,compareCarsBlocInstance: compareCarsBlocInstance,previousComparisonBlocInstance: previousComparisonBlocInstance,)));
        }
      },
      builder: (context, state) {
        return Material(
          color: Colors.red,
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              if(carForComparing1.isNotEmpty && carForComparing2.isNotEmpty){
                compareCarsButtonBlocInstance.add(NavigateToComparedScreenEvent());
              }else{
                snackbarWidget('Provide the cars for comparison', context, Colors.green, Colors.white, SnackBarBehavior.fixed);
              }
            },
            child: SizedBox(
              height: screenSize.height / 15,
              child: Center(
                child: MyTextWidget(
                  text: 'Compare',
                  color: Colors.white,
                  size: screenSize.width / 22,
                  weight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
