import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/compare_car/previous_comparison/previous_empty_screen/previous_empty_screen.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/compare_car/previous_comparison/previous_not_empty_screen/previous_not_empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviousComparison extends StatelessWidget {
  const PreviousComparison({super.key, required this.screenSize,required this.previousComparisonBlocInstance,required this.compareCarsBlocInstance});
  final Size screenSize;
  final ProfileScreenBloc compareCarsBlocInstance;
  final ProfileScreenBloc previousComparisonBlocInstance;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
      bloc: previousComparisonBlocInstance,
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextWidget(
                    text: 'Previous Compared Cars',
                    color: Colors.blueGrey,
                    size: screenSize.width / 22,
                    weight: FontWeight.bold),
                previousComparisonList.isNotEmpty
                    ? PreviousNotEmptyScreen(screenSize: screenSize, compareCarsBlocInstance: compareCarsBlocInstance, previousComparisonBlocInstance: previousComparisonBlocInstance)
                    : PreviousEmptyScreen(screenSize: screenSize)
              ],
            ),
          ),
        );
      },
    );
  }
}
