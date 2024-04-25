import 'package:flutter/material.dart';

class BuyScreen extends StatelessWidget {
  const BuyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(      
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('FIND THE RIGHT USED CARS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.blue),)
          ],
        ),
      )
    );
  }
}