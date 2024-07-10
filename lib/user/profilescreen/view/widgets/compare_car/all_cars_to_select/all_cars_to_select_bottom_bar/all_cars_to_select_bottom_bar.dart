import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCarsToSelectBottomBar extends StatelessWidget {
  const AllCarsToSelectBottomBar(
      {super.key,
      required this.screenSize,
      required this.carSelectionScreen,
      required this.compareCarsBlocInstance});
  final Size screenSize;
  final ProfileScreenBloc carSelectionScreen;
  final ProfileScreenBloc compareCarsBlocInstance;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
      bloc: carSelectionScreen,
      builder: (context, state) {
        return Visibility(
            visible: carForComparing1.isNotEmpty && carForComparing2.isNotEmpty,
            child: BottomAppBar(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  if (carForComparing1.isNotEmpty &&
                      carForComparing2.isNotEmpty) {
                    Navigator.of(context).pop(context);
                    compareCarsBlocInstance.add(CompareCarScreenRefreshEvent());
                  }
                },
                child: Ink(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green),
                  child: Center(
                      child: MyTextWidget(
                          text: 'Select Cars',
                          color: Colors.white,
                          size: screenSize.width / 25,
                          weight: FontWeight.bold)),
                ),
              ),
            ));
      },
    );
  }
}
