import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/emicalculator/view/emi_calculator_screen.dart';
import 'package:flutter/material.dart';

class EmiCardWidget extends StatelessWidget {
  const EmiCardWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.5),
      child: Container(
        height: screenSize.height/4.3,
        width: screenSize.width,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 140, 255),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 10,left: 25,right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextWidget(text: 'Ready to drive your dream?', color: Colors.white, size: screenSize.width/20, weight: FontWeight.bold),
              Text("Check out for your preferred EMI frequency\nand hit the road hassle-free!\n*T&C applied",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: screenSize.width/38),),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyTextWidget(text: '0', color: Colors.white, size: screenSize.width/18, weight: FontWeight.bold),
                      MyTextWidget(text: 'Down payment', color: Colors.white, size: screenSize.width/33, weight: FontWeight.bold),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyTextWidget(text: '9%', color: Colors.white, size: screenSize.width/18, weight: FontWeight.bold),
                      MyTextWidget(text: 'Interest Rate', color: Colors.white, size: screenSize.width/33, weight: FontWeight.bold),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyTextWidget(text: '32', color: Colors.white, size: screenSize.width/18, weight: FontWeight.bold),
                      MyTextWidget(text: 'Months Emi', color: Colors.white, size: screenSize.width/33, weight: FontWeight.bold),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: screenSize.width,
                height: screenSize.height/25,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EmiCalculatorScreen(screenSize: screenSize,),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: MyTextWidget(text: 'CALCULATE & GET EMI', color: Colors.blueGrey, size: screenSize.width/30, weight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}