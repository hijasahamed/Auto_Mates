
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/compare_car/compare_button/compare_button.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/compare_car/compare_screen_appbar/compare_screen_app_bar.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/compare_car/compare_section/compare_section.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/compare_car/previous_comparison/previous_comparison.dart';
import 'package:flutter/material.dart';

class CompareCars extends StatelessWidget {
  const CompareCars({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    final ProfileScreenBloc compareCarsBlocInstance = ProfileScreenBloc();
    final ProfileScreenBloc previousComparisonBlocInstance = ProfileScreenBloc();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenSize.height/3.5),
          child: CompareScreenAppBar(screenSize: screenSize,),
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextWidget(
                text: 'Select the car varient you want to compare',
                color: Colors.blueGrey,
                size: screenSize.width / 22,
                weight: FontWeight.bold),
          ),
          CompareSection(screenSize: screenSize,compareCarsBlocInstance: compareCarsBlocInstance,),
          CompareButton(screenSize: screenSize,compareCarsBlocInstance: compareCarsBlocInstance,previousComparisonBlocInstance: previousComparisonBlocInstance,),
          PreviousComparison(screenSize: screenSize,previousComparisonBlocInstance: previousComparisonBlocInstance,compareCarsBlocInstance: compareCarsBlocInstance,)                   
        ],
      ),
    );
  }
}
