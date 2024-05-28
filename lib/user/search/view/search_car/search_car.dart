import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class SearchCar extends StatelessWidget {
  const SearchCar({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: screenSize.height/5,
              width: screenSize.width/1.1,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/search any.png'),fit: BoxFit.cover)
              ),
            ),
            SizedBox(height: screenSize.height/50,),
            const MyTextWidget(text: 'Search and find your car', color: Colors.black, size: 15, weight: FontWeight.bold)
          ],
        ),
      ),
    );
  }
}