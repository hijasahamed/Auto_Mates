import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

TextEditingController soldAmountController = TextEditingController();

getCarSoldPrice({carData,markCarsoldBloc,context,screenSize,}){
  Navigator.of(context).pop();
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: screenSize.width/2,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Container(
                    height: screenSize.height/9,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/money-stack.png'))
                    ),
                  ),
                   Positioned(
                    top: 0,right: 0,
                    child: IconButton(onPressed: () {
                      Navigator.pop(context);
                      soldAmountController.clear();
                    }, icon: const Icon(Icons.close,color: Colors.red,))
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextWidget(
                      text: 'Enter the amount for which the car was sold.', 
                      color: Colors.black, 
                      size: screenSize.width/28, 
                      weight: FontWeight.bold,
                      maxline: true,
                      alignTextCenter: false,
                    ),
                    MyTextWidget(
                      text: 'Car Actual Price: ₹${carData['price']}.', 
                      color: Colors.green, 
                      size: screenSize.width/30, 
                      weight: FontWeight.bold,
                      maxline: true,
                      alignTextCenter: true,
                    ),
                    SizedBox(height: screenSize.height/90,),
                    TextField(
                      controller: soldAmountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter the sold price',
                        labelStyle: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: screenSize.width/32),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        border: OutlineInputBorder(          
                          borderRadius: BorderRadius.circular(10),
                        ),                  
                      ),
                    ),
                    SizedBox(height: screenSize.height/50,),
                    GestureDetector(
                      onTap: () {
                        markSellerCarToSold(carData: carData,context: context,markCarsoldBloc: markCarsoldBloc,screenSize: screenSize);
                      },
                      child: Container(
                        height: screenSize.height/18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: .8,color: Colors.grey),
                          color: Colors.white
                        ),
                        child: Center(
                          child: MyTextWidget(text: 'Submit & Remove The Car', color: Colors.red, size: screenSize.width/30, weight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}