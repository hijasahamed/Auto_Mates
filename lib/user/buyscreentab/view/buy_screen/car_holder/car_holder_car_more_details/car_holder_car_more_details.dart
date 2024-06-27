import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class CarHolderCarMoreDetails extends StatelessWidget {
  const CarHolderCarMoreDetails(
      {super.key, required this.screenSize, required this.data});
  final Size screenSize;
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: MyTextWidget(
              text: '${data['year']} model',
              color: Colors.black,
              size: 12,
              weight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: MyTextWidget(
              text: '${data['kilometer']} kilometers',
              color: Colors.black,
              size: 12,
              weight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Row(
            children: [
              MyTextWidget(
                  text: 'Rs.${data['price']}',
                  color: const Color.fromARGB(255, 10, 104, 12),
                  size: 15,
                  weight: FontWeight.bold),
              SizedBox(
                width: screenSize.width / 120,
              ),
              const MyTextWidget(
                  text: 'Lakhs',
                  color: Colors.black,
                  size: 12,
                  weight: FontWeight.w500)
            ],
          ),
        ),
      ],
    );
  }
}
