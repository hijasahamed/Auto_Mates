import 'dart:io';

import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
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
            border: Border.all(
                width: .5, color: const Color.fromARGB(255, 189, 189, 189))),
        child: const Center(
            child: ColoredBox(
                color: Colors.black54,
                child: MyTextWidget(
                    text: 'Thumbnail',
                    color: Colors.white,
                    size: 15,
                    weight: FontWeight.bold))));
  }
}
