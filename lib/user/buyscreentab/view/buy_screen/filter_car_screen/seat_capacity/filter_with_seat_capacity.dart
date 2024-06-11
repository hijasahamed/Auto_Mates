import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/seat_capacity/seat_capacity_container_widget/seat_capacity_container_widget.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilterWithSeatCapacity extends StatelessWidget {
  const FilterWithSeatCapacity({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyTextWidget(
              text: 'Seating Capacity',
              color: Color.fromARGB(255, 136, 136, 136),
              size: 15,
              weight: FontWeight.w700),
          SeatCapacityContainerWidget(screenSize: screenSize)
        ],
      ),
    );
  }
}