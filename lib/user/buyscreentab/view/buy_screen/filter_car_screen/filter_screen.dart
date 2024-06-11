import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/car_brands/filter_with_car_brands.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/fuel_types/filter_with_fuel_type.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/price/filter_with_price.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/seat_capacity/filter_with_seat_capacity.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/transmission_types/filter_with_transmission_types.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.screenSize});
  final Size screenSize;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  void dispose() {
    selectedCarFilterdList.clear();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: NormalAppBar(
            title: 'Filter',
            isFromFilterPage: true,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              FilterWithCarBrands(
                screenSize: widget.screenSize,
              ),
              FilterWithFuelType(
                screenSize: widget.screenSize,
              ),
              FilterWithTransmissionTypes(
                screenSize: widget.screenSize,
              ),
              FilterWithSeatCapacity(screenSize: widget.screenSize),
              FilterWithPrice(screenSize: widget.screenSize),             
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: widget.screenSize.height / 13,
        elevation: 10,
        color: Colors.white,
        child: Ink(
          height: widget.screenSize.height / 15,
          width: widget.screenSize.width / 1.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.redAccent,
          ),
          child: InkWell(
            onTap: () {},
            child: const Center(
              child: MyTextWidget(
                  text: 'Apply Filters',
                  color: Colors.white,
                  size: 16,
                  weight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
