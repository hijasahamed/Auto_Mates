import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/price/price_container_widget/price_containers_widget.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class FilterWithPrice extends StatelessWidget {
  const FilterWithPrice({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyTextWidget(
              text: 'Budget',
              color: Color.fromARGB(255, 136, 136, 136),
              size: 15,
              weight: FontWeight.w700),
          PriceContainersWidget(screenSize: screenSize,)
        ],
      ),
    );
  }
}