import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class RelatedCarDetailsHolder extends StatelessWidget {
  const RelatedCarDetailsHolder({super.key, required this.carData});
  final dynamic carData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextWidget(
              text: '${carData['brand']} ${carData['modelName']}',
              color: const Color.fromARGB(255, 2, 85, 119),
              size: 18,
              weight: FontWeight.bold),
          MyTextWidget(
              text: '${carData['kilometer']} Kilometers',
              color: const Color.fromARGB(255, 100, 100, 100),
              size: 13,
              weight: FontWeight.bold),
          MyTextWidget(
              text: '${carData['year']} Model',
              color: const Color.fromARGB(255, 100, 100, 100),
              size: 13,
              weight: FontWeight.bold),
          Row(
            children: [
              MyTextWidget(
                  text: 'Rs.${carData['price']} ',
                  color: Colors.green,
                  size: 16,
                  weight: FontWeight.bold),
              const MyTextWidget(
                  text: 'Lakhs only',
                  color: Color.fromARGB(255, 100, 100, 100),
                  size: 12,
                  weight: FontWeight.bold),
            ],
          ),
        ],
      ),
    );
  }
}
