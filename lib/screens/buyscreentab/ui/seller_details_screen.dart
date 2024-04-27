import 'dart:async';

import 'package:auto_mates/screens/buyscreentab/ui/buy_screen.dart';
import 'package:auto_mates/screens/buyscreentab/ui/car_details_widget.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            CarDetailsWidget(screenSize: screenSize, data: data),
          ],
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
                  padding: EdgeInsets.only(left: 25,right: 25),
                  child: Row(
                    children: [
                      Icon(Icons.chat_outlined,size: 40,color: Colors.white,),
                      Spacer(),
                      Text('Chat',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)
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
                  return const CustomAlertDialog();
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
                  child: Text('Interested',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
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


class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({super.key});

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State
{
  late int _secondsLeft;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _secondsLeft = 5; 
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsLeft > 0) {
          _secondsLeft--;
        } else {
          Navigator.of(context).pop();
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFDBEDF5),
      title: const Text('Interest Marked',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF424141)),),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Thank you for showing interest in this car. The seller will contact you shortly to discuss the deal.',style: TextStyle(fontWeight: FontWeight.w500),),
          Text('This dialog will close in $_secondsLeft seconds.'),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close Now'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}


