import 'dart:async';

import 'package:flutter/material.dart';

class CustomAlertDialogeWidget extends StatefulWidget {
  const CustomAlertDialogeWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  State<CustomAlertDialogeWidget> createState() => _CustomAlertDialogeWidgetState();
}

class _CustomAlertDialogeWidgetState extends State<CustomAlertDialogeWidget> {

  late int secondsLeft;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    secondsLeft=10;
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
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Thank you for showing interest in this car. The seller will contact you shortly to discuss the deal.',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
          SizedBox(height: widget.screenSize.height/50,),
          const Text('Connect seller directly?',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: (){}, 
              child: Row(
                children: [
                  const Icon(Icons.call,color: Colors.green,),
                  SizedBox(width: widget.screenSize.width/35,),
                  const Text('Call Seller'),                  
                ],
              ), 
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Back',style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(width: widget.screenSize.width/35,),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 13,
                    child: Text('$secondsLeft',style: TextStyle(color: Colors.white,),),
                  )
                ],
              ), 
            ),
          ],
        )
      ],
    );
  }
}