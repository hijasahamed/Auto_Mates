import 'dart:async';

import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class CustomAlertDialogeWidget extends StatefulWidget {
  const CustomAlertDialogeWidget({super.key,required this.screenSize,required this.data});
  final Size screenSize;
  final dynamic data;
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
      backgroundColor: Colors.white,
      title: const Text('Mark Your Interest',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF424141)),),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Thank you for showing interest in this car. The seller will contact you shortly if you click the intrested button to discuss the deal.',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
          SizedBox(height: widget.screenSize.height/50,),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: (){
                markUserInterest(context: context,carImage: widget.data['image'],carName: widget.data['modelName'],carNumber: widget.data['regNumber']);
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.green)
              ), 
              child: const Text('Mark a Intrest',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),), 
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red)
              ), 
              child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Back',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  SizedBox(width: widget.screenSize.width/35,),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 14,                    
                    child: MyTextWidget(text: secondsLeft.toString(), color: Colors.black, size: 15, weight: FontWeight.w600),
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