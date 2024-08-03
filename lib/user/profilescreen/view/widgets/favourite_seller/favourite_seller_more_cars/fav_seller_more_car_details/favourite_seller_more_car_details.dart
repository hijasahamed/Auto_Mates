import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class FavouriteSellerMoreCarDetails extends StatelessWidget {
  const FavouriteSellerMoreCarDetails(
      {super.key, required this.car, required this.screenSize});
  final dynamic car;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextWidget(
              text: '${car['year']} ${car['brand']} ${car['modelName']}',
              color: const Color(0xFF424141),
              size: 19,
              weight: FontWeight.w500),
          MyTextWidget(
              text:
                  '${car['kilometer']} | ${car['fuel']} | ${car['transmission']}',
              color: const Color.fromARGB(255, 132, 132, 132),
              size: 15,
              weight: FontWeight.w500),
          SizedBox(
            height: screenSize.height / 100,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyTextWidget(
                  text: '₹${car['price']}',
                  color: Colors.green,
                  size: screenSize.width/25,
                  weight: FontWeight.bold),
                  SizedBox(width: screenSize.width/100,),
              MyTextWidget(
                  text: 'Lakh',
                  color: Colors.blueGrey,
                  size: screenSize.width/40,
                  weight: FontWeight.w500),
            ],
          )
        ],
      ),
    );
  }
}
