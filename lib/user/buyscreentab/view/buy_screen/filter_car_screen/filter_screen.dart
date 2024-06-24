import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/buy_screen.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/car_brands/filter_with_car_brands.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/fuel_types/filter_with_fuel_type.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/price/filter_with_price.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/seat_capacity/filter_with_seat_capacity.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/transmission_types/filter_with_transmission_types.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filterd_results/filterd_cars_result_screen.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<String> selectedCarFilterdList = [];

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key, required this.screenSize});
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: NormalAppBar(
            title: 'Filter',
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              FilterWithCarBrands(
                screenSize: screenSize,
              ),
              FilterWithFuelType(
                screenSize: screenSize,
              ),
              FilterWithTransmissionTypes(
                screenSize: screenSize,
              ),
              FilterWithSeatCapacity(screenSize: screenSize),
              FilterWithPrice(screenSize: screenSize),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<BuyScreenBloc, BuyScreenState>(
        bloc: filterCarLengthBlocInstance,
        builder: (context, state) {
          return BottomAppBar(
            height: screenSize.height / 13,
            elevation: 10,
            color: Colors.white,
            child: Ink(
              height: screenSize.height / 15,
              width: screenSize.width / 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.redAccent,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return FilterResultsScreen(
                        filterdCarList: filterdCarList,
                        screenSize: screenSize,
                      );
                    },
                  ));
                },
                child: BlocBuilder<BuyScreenBloc, BuyScreenState>(
                  bloc: filterCarLengthBlocInstance,
                  builder: (context, state) {
                    return Center(
                      child: MyTextWidget(
                          text: 'Apply Filters (${filterdCarList.length})',
                          color: Colors.white,
                          size: 16,
                          weight: FontWeight.w600),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
