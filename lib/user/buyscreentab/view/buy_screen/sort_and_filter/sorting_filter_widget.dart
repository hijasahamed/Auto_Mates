import 'package:flutter/material.dart';

class SortingFilteringWidget extends StatelessWidget {
  const SortingFilteringWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){}, 
      icon: const Icon(Icons.sort,color: Colors.white,size: 35,)
    );
  }
}


