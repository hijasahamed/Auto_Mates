import 'dart:io';

import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddedCarImages extends StatelessWidget {
  const AddedCarImages({super.key,required this.sellerHomeScreenBloc});
 final SellerHomeScreenBloc sellerHomeScreenBloc;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellerHomeScreenBloc,SellerHomeScreenState>(
      bloc: sellerHomeScreenBloc,
      builder: (context, state) {
        return GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
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
      },
    );
  }
}
