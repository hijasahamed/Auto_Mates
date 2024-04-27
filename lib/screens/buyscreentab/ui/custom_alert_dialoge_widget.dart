import 'dart:async';

import 'package:flutter/material.dart';

class CustomAlertDialogeWidget extends StatefulWidget {
  const CustomAlertDialogeWidget({super.key});

  @override
  State<CustomAlertDialogeWidget> createState() => _CustomAlertDialogeWidgetState();
}

class _CustomAlertDialogeWidgetState extends State<CustomAlertDialogeWidget> {

  late int secondsLeft;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    secondsLeft=5;
    timer=Timer.periodic(const Duration(seconds: 1), (timer) { 
      setState(() {
        if(secondsLeft>0){
          secondsLeft--;
        }
        else{
          Navigator.of(context).pop();
          timer.cancel();
        }
      });
     });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFDBEDF5),
      title: const Text('Interest Marked',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF424141)),),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Thank you for showing interest in this car. The seller will contact you shortly to discuss the deal.',style: TextStyle(fontWeight: FontWeight.w500),),
          // Text('This dialog will close in $secondsLeft seconds.'),
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
}