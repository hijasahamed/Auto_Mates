import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class EmiCalculatorContainer extends StatelessWidget {
  const EmiCalculatorContainer({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 195, 226, 239),
      ),
      height: screenSize.height/7,
      child: InkWell(
        onTap: () {
          
        }, 
        child: Stack(
            children: [
              Positioned(
                left: 77,
                top: 37,
                child: Container(
                  height: screenSize.height/18,
                  width: screenSize.width/9,
                  decoration: const BoxDecoration(                           
                    image: DecorationImage(image: AssetImage('assets/images/calculator (1).png'),fit: BoxFit.cover)
                  ),
                ),
              ),
              const Positioned(
              bottom: 18,
              left: 47,
              child: MyTextWidget(text: "EMI Calculator", color: Color(0XFF424141), size: 15, weight: FontWeight.bold)
            ),
            ],
          ),     
      ),
     ),
    );
  }
}