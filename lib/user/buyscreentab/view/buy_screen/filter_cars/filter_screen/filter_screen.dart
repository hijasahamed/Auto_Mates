import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/buy_screen.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_cars/car_brands/filter_with_car_brands.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_cars/fuel_types/filter_with_fuel_type.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: NormalAppBar(
            title: 'Filter',
            isFromFilterPage: true,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: BlocBuilder<BuyScreenBloc, BuyScreenState>(
            bloc: buyScreenBloc,
            builder: (context, state) {
              return Column(
                children: [
                  FilterWithCarBrands(
                    screenSize: screenSize,
                  ),
                  FilterWithFuelType(screenSize: screenSize,)
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: screenSize.height/13,        
        elevation: 10,
        color: Colors.white,       
        child: Ink(
          height: screenSize.height/15,
          width: screenSize.width / 1.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          child: InkWell(
            onTap: () {
              
            },
            child: const Center(
              child: MyTextWidget(text: 'Filter Choices', color: Colors.white, size: 15, weight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
