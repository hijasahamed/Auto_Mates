import 'package:flutter/material.dart';

class AllCarsToSellWidget extends StatelessWidget {
  const AllCarsToSellWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: .9,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Card(          
          elevation: 5,
          child: Container(
            color: Colors.yellow,
          ),
        );
      },
    );
  }
}