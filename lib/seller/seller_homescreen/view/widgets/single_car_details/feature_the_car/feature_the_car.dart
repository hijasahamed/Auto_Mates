// ignore_for_file: use_build_context_synchronously

import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/seller/seller_homescreen/controller/payments_services.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/single_car_details/feature_the_car/payment_success_page/payment_success_page.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class FeatureTheCar extends StatelessWidget {
  const FeatureTheCar(
      {super.key, required this.screenSize, required this.carData,required this.sellerData});
  final Size screenSize;
  final dynamic carData;
  final SellerData sellerData;
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
            paymentSuccessPage(context: context,paidAmount: 10000,screenSize: screenSize,title: 'This Car is Added to the Featured Cars'),
            addRevenueDataToDataBase(amount: 10000, paidBy: sellerData.companyName, paidFor: 'Featuring Car'),
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
                  text: '₹10000/- Month',
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
