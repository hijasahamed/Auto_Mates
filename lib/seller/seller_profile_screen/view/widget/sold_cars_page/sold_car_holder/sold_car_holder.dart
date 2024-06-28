import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class SoldCarHolder extends StatelessWidget {
  const SoldCarHolder({super.key,required this.screenSize,required this.car});
  final Size screenSize;
  final dynamic car;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 241, 241, 241),
      elevation: 5,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5), 
              child: FadeInImage(
                  fadeInDuration: const Duration(milliseconds: 800),
                  height: screenSize.height / 10,
                  width: screenSize.width / 3.5,
                  placeholder: const AssetImage(
                    'assets/images/image placeholder.jpeg',
                  ),
                  placeholderFit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    );
                  },
                  image: NetworkImage(car['thumbnail']),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  MyTextWidget(text: car['brand'], color: const Color(0xff424141), size: screenSize.width/25, weight: FontWeight.bold),
                  SizedBox(width: screenSize.width/90,),
                  MyTextWidget(text: car['modelName'], color: const Color(0xff424141), size: screenSize.width/25, weight: FontWeight.w500),
                ],
              ),
              MyTextWidget(text: car['regNumber'], color: const Color(0xff424141), size: screenSize.width/35, weight: FontWeight.bold),
              MyTextWidget(text: '₹${car['price']} Lakh', color: const Color(0xff424141), size: screenSize.width/35, weight: FontWeight.bold),
              Row(
                children: [
                  MyTextWidget(text: 'Sold For: ₹${car['soldAmount']}', color: Colors.green, size: screenSize.width/30, weight: FontWeight.bold),
                  MyTextWidget(text: ' Lakh', color: const Color(0xff424141), size: screenSize.width/40, weight: FontWeight.bold),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}