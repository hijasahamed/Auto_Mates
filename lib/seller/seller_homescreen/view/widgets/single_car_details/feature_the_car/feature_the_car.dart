// ignore_for_file: use_build_context_synchronously

import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/seller/seller_homescreen/controller/payments_services.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class FeatureTheCar extends StatelessWidget {
  const FeatureTheCar(
      {super.key, required this.screenSize, required this.carData});
  final Size screenSize;
  final dynamic carData;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 238, 238, 238),
      elevation: 4,
      child: InkWell(
        onTap: () async {         
          dynamic pay = await StripePaymentService.instance
              .makePayment(amountToPay: 10000)
              .then((value) => value == true ? true : false);
          pay == true
          ? {           
            showDialog(
              context: context,
              barrierDismissible: false,
              barrierColor: Colors.black54,
              builder: (context) {
                return Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: screenSize.width/4.5,
                        backgroundColor: Colors.green,
                        child: Center(
                          child: Icon(Icons.check,color: Colors.white,size: screenSize.width/6.5,),
                        ),
                      ),
                      SizedBox(height: screenSize.height/50,),
                      MyTextWidget(text: "payment Successfull", color: Colors.grey, size: screenSize.width/25, weight: FontWeight.bold),
                      SizedBox(height: screenSize.height/100,),
                      MyTextWidget(text: "Amount Paid ₹9,999 /-", color: Colors.green, size: screenSize.width/27, weight: FontWeight.bold),
                      SizedBox(height: screenSize.height/25,),
                      MyTextWidget(text: 'This Car is Added to the Featured Cars', color: Colors.blueGrey, size: screenSize.width/17, weight: FontWeight.bold,maxline: true,alignTextCenter: true,),
                    ],
                  ),
                );
              },
            ),
            await Future.delayed(const Duration(seconds: 3)),
            Navigator.of(context).pop(),
            addCarToFeatured(carDocumentSnapshot: carData,context: context,screenSize: screenSize),
          }
          : {
            snackbarWidget('Payment Failed', context, Colors.red,Colors.white, SnackBarBehavior.fixed),
          };
        },
        child: Padding(
          padding: EdgeInsets.all(screenSize.width / 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextWidget(
                  text: 'Advertise this car to the Users?',
                  color: Colors.blueGrey,
                  size: screenSize.width / 22,
                  weight: FontWeight.bold),
              SizedBox(
                height: screenSize.height / 150,
              ),
              MyTextWidget(
                text:
                    'AutoMates provide featured section to promote your cars for better reach.',
                color: Colors.grey,
                size: screenSize.width / 30,
                weight: FontWeight.bold,
                maxline: true,
              ),
              SizedBox(
                height: screenSize.height / 150,
              ),
              MyTextWidget(
                  text: '₹9999 /- Monthly',
                  color: Colors.green,
                  size: screenSize.width / 20,
                  weight: FontWeight.bold),
              SizedBox(
                height: screenSize.height / 150,
              ),
              MyTextWidget(
                  text: 'Tap On to pay and Feature your car now',
                  color: Colors.grey,
                  size: screenSize.width / 25,
                  weight: FontWeight.bold),
            ],
          ),
        ),
      ),
    );
  }
}
