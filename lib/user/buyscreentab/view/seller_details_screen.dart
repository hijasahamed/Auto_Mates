
import 'package:auto_mates/user/buyscreentab/view/buy_screen.dart';
import 'package:auto_mates/user/buyscreentab/view/widgets/car_details_widget.dart';
import 'package:auto_mates/user/buyscreentab/view/widgets/custom_alert_dialoge_widget.dart';
import 'package:auto_mates/user/buyscreentab/view/widgets/seller_details_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SellerDetailsScreen extends StatelessWidget {
  const SellerDetailsScreen(
      {super.key, required this.screenSize, required this.data});
  final Size screenSize;
  final AllCars data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 76, 207, 239),
                Color.fromARGB(255, 80, 171, 250)
              ],
            ),
          ),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: const Text(
          'Seller Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [              
              SellerDetailsWidget(screenSize: screenSize),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Car Details',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xFF424141)),),
              ),
              CarDetailsWidget(screenSize: screenSize, data: data),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              highlightColor: const Color(0xFFDBEDF5),
              onTap: () {
                if (kDebugMode) {
                  print('Chat button clicked');
                }
              },
              child: Ink(
                height: screenSize.height/20,
                width: screenSize.width/2.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.blue
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 35,right: 35),
                  child: Row(
                    children: [
                      Icon(Icons.chat_outlined,size: 25,color: Colors.white,),
                      Spacer(),
                      Text('Chat',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              highlightColor: const Color(0xFFDBEDF5),
              onTap: () {
                showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return CustomAlertDialogeWidget(screenSize: screenSize,);
                },
              );
              },
              child: Ink(
                height: screenSize.height/20,
                width: screenSize.width/1.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.green
                ),
                child: const Center(
                  child: Text('Interested',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class CarMoreDetails extends StatelessWidget {
  const CarMoreDetails({super.key,required this.text,required this.icon});
  final String text;
  final FaIcon icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon, 
        Text(text,style: const TextStyle(color:Color.fromARGB(255, 118, 118, 118),fontWeight: FontWeight.w500 ),)
      ],
    );
  }
}


