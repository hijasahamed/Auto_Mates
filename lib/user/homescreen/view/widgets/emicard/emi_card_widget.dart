import 'package:auto_mates/user/emicalculator/view/emi_calculator_screen.dart';
import 'package:flutter/material.dart';

class EmiCardWidget extends StatelessWidget {
  const EmiCardWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height/4.5,
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
            const Text('Ready to drive your dream?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 19),),
            const Text("Choose your preferred EMI frequency\nand hit the road hassle-free!\n*T&C applied",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 10),),
            const Spacer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('0',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 23),),
                    Text('Down payment',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 13),)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('9%',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 23),),
                    Text('Interest rate',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 13),)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('32',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 23),),
                    Text('Months EMI',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 13),)
                  ],
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: screenSize.width,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EmiCalculatorScreen(screenSize: screenSize,),
                  ));
                },
                child: const Text('CALCULATE & GET OFFERS',style: TextStyle(color: Color(0xFF424141),fontWeight: FontWeight.bold),)
              ),
            )
          ],
        ),
      ),
    );
  }
}