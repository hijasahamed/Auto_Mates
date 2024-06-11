import 'dart:io';

import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:flutter/material.dart';

class AddedThumbnailImage extends StatelessWidget {
  const AddedThumbnailImage({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height / 6,
      width: screenSize.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: FileImage(File(thumbnailImage!)), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: const Color(0xFF424141))),
    );
  }
}
