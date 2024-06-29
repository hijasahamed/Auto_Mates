import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/compare_car/all_cars_to_select/all_cars_to_select.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/compare_car/compare_section/car_one.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/compare_car/compare_section/car_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompareSection extends StatelessWidget {
  const CompareSection({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    final ProfileScreenBloc compareCarsBlocInstance = ProfileScreenBloc();
    return BlocConsumer<ProfileScreenBloc, ProfileScreenState>(
      bloc: compareCarsBlocInstance,
      listener: (context, state) {
        if (state is NavigateToSelectCarForComaparingPageState) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AllCarsToSelect(
                    screenSize: screenSize,
                    listOne: state.boolVal,
                    compareCarsBlocInstance: compareCarsBlocInstance,
                  )));
        }
      },
      builder: (context, state) {
        return Container(
            height: screenSize.height / 3.9,
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Color.fromARGB(255, 219, 219, 219)),
                  top: BorderSide(color: Color.fromARGB(255, 219, 219, 219))),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    CarOne(compareCarsBlocInstance: compareCarsBlocInstance, screenSize: screenSize),
                    CarTwo(compareCarsBlocInstance: compareCarsBlocInstance, screenSize: screenSize)
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.blueGrey,
                    child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: MyTextWidget(
                            text: 'V/S',
                            color: Colors.red,
                            size: screenSize.width / 36,
                            weight: FontWeight.bold)),
                  ),
                )
              ],
            ));
      },
    );
  }
}
