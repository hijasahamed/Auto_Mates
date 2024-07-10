import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/compare_car/all_cars_to_select/all_cars_to_select_back_button/all_cars_to_select_back_button.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/compare_car/all_cars_to_select/all_cars_to_select_bottom_bar/all_cars_to_select_bottom_bar.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/compare_car/all_cars_to_select/all_cars_to_select_holder/all_cars_to_select_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCarsToSelect extends StatelessWidget {
  const AllCarsToSelect(
      {super.key,
      required this.screenSize,
      this.listOne,
      required this.compareCarsBlocInstance});
  final Size screenSize;
  final bool? listOne;
  final ProfileScreenBloc compareCarsBlocInstance;
  @override
  Widget build(BuildContext context) {
    ProfileScreenBloc carSelectionScreen = ProfileScreenBloc();
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AllCarsToSelectBackButton(screenSize: screenSize,carSelectionScreen: carSelectionScreen,compareCarsBlocInstance: compareCarsBlocInstance,),
              Expanded(
                child: FutureBuilder(
                  future: fetchAllCarsForComparing(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.blue,
                      ));
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No Cars Available'));
                    } else {
                      List<Map<String, dynamic>> cars = snapshot.data!;
                      return BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
                        bloc: carSelectionScreen,
                        builder: (context, state) {
                          return ListView.builder(
                            itemCount: cars.length,
                            itemBuilder: (context, index) {
                              final car = cars[index];
                              bool isSelected = carForComparing1.any(
                                      (comparedCar) =>
                                          comparedCar['regNumber'] ==
                                          car['regNumber']) ||
                                  carForComparing2.any((comparedCar) =>
                                      comparedCar['regNumber'] ==
                                      car['regNumber']);
                              Color carContainerColor = isSelected
                                  ? const Color.fromARGB(255, 194, 231, 248)
                                  : const Color.fromARGB(255, 237, 237, 237);
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    addCarToComparingList(
                                        car: car,
                                        carSelectionScreen: carSelectionScreen,
                                        context: context);
                                  },
                                  child: AllCarsToSelectHolder(
                                    screenSize: screenSize, 
                                    carContainerColor: carContainerColor, 
                                    car: car, 
                                    isSelected: isSelected
                                  )
                                ),
                              );
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AllCarsToSelectBottomBar(
          screenSize: screenSize, 
          carSelectionScreen: carSelectionScreen, 
          compareCarsBlocInstance: compareCarsBlocInstance
        )
      );
  }
}
