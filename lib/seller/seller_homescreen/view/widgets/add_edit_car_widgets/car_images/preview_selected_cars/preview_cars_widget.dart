import 'dart:io';

import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class PreviewCarsWidget extends StatelessWidget {
  const PreviewCarsWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const MyTextWidget(text: 'Preview', color: Colors.grey, size: 16, weight: FontWeight.w400),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,)
        ),
      ),
      body: PageView.builder(
            padEnds: true,            
            itemCount: selectedImages.length,
            itemBuilder: (context, index) {
              return Center(
                child: Container(
                  height: screenSize.height/2.3,
                  width: screenSize.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(selectedImages[index].path)),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                            ),
              );
            },
          ),
    );
  }
}