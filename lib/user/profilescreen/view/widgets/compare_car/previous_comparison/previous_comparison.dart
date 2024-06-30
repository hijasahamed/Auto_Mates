import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/compare_car/compared_screen/car_compared_screen.dart';
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
                    ? Expanded(
                        child: GestureDetector(
                          onTap: () {
                            carForComparing1.add(previousComparisonList[0]);
                            carForComparing2.add(previousComparisonList[1]);
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CarComparedScreen(
                                screenSize: screenSize,compareCarsBlocInstance: compareCarsBlocInstance,previousComparisonBlocInstance: previousComparisonBlocInstance,)));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 236, 236, 236),
                                borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      previousComparisonList[0]
                                                          ['thumbnail']),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(6))),
                                        ),
                                      ),
                                      MyTextWidget(
                                          text: previousComparisonList[0]
                                              ['brand'],
                                          color: Colors.black,
                                          size: screenSize.width / 30,
                                          weight: FontWeight.bold),
                                      MyTextWidget(
                                          text: previousComparisonList[0]
                                              ['modelName'],
                                          color: Colors.black,
                                          size: screenSize.width / 35,
                                          weight: FontWeight.bold),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: screenSize.width / 145,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      previousComparisonList[1]
                                                          ['thumbnail']),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(6))),
                                        ),
                                      ),
                                      MyTextWidget(
                                          text: previousComparisonList[1]
                                              ['brand'],
                                          color: Colors.black,
                                          size: screenSize.width / 30,
                                          weight: FontWeight.bold),
                                      MyTextWidget(
                                          text: previousComparisonList[1]
                                              ['modelName'],
                                          color: Colors.black,
                                          size: screenSize.width / 35,
                                          weight: FontWeight.bold),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/previous_compare.webp'),
                            )),
                            child: Center(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black38,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: MyTextWidget(
                                        text: ' No History ',
                                        color: Colors.white,
                                        size: screenSize.width / 28,
                                        weight: FontWeight.bold))),
                          ),
                        ),
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
