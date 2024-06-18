import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class CarHolderCarNameBrand extends StatelessWidget {
  const CarHolderCarNameBrand(
      {super.key, required this.screenSize, required this.data});
  final Size screenSize;
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Row(
        children: [
          MyTextWidget(
              text: '${data['brand']}',
              color: const Color(0XFF143A42),
              size: 18,
              weight: FontWeight.bold),
          SizedBox(
            width: screenSize.width / 100,
          ),
          Expanded(
              child: MyTextWidget(
                  text: '${data['modelName']}',
                  color: const Color.fromARGB(255, 9, 87, 189),
                  size: 15,
                  weight: FontWeight.bold)),
        ],
      ),
    );
  }
}
