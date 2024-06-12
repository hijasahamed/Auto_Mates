import 'dart:io';

import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:flutter/material.dart';

class AddedCarImages extends StatelessWidget {
  const AddedCarImages({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: selectedImages.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: FileImage(File(selectedImages[index].path)),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(5),            
          ),
        );
      },
    );
  }
}
