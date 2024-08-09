import 'dart:io';

import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/car_images/added_car_images.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarEditPageThumbnailImages extends StatelessWidget {
  const CarEditPageThumbnailImages(
      {super.key, required this.screenSize, required this.data});
  final Size screenSize;
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    SellerHomeScreenBloc editImageBloc = SellerHomeScreenBloc();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyTextWidget(
                  text: 'Thumbnail',
                  color: Colors.grey,
                  size: screenSize.width / 35,
                  weight: FontWeight.bold),
              MyTextWidget(
                  text: 'Images   ',
                  color: Colors.grey,
                  size: screenSize.width / 35,
                  weight: FontWeight.bold),
            ],
          ),
          Container(
            height: screenSize.height / 6,
            width: screenSize.width,
            decoration: BoxDecoration(
                border: Border.all(width: .2, color: Colors.grey)),
            child: BlocBuilder<SellerHomeScreenBloc, SellerHomeScreenState>(
              bloc: editImageBloc,
              builder: (context, state) {
                return Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        addCarThumbnail(bloc: editImageBloc);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: thumbnailImage == null
                                ? NetworkImage(data['thumbnail'])
                                    as ImageProvider<Object>
                                : FileImage(File(thumbnailImage!))
                                    as ImageProvider<Object>,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: thumbnailImage == null 
                          ? ColoredBox(
                            color: Colors.black45,
                            child: MyTextWidget(text: 'Change Thumbnail', color: Colors.white, size: screenSize.width/30, weight: FontWeight.bold))
                          : null
                        ),
                      ),
                    )),
                    SizedBox(width: screenSize.width/175,),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          addMultipleImages(bloc: editImageBloc);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: .2, color: Colors.grey),
                          ),
                          child: selectedImages.isEmpty
                              ? data['image'] != null && data['image'].isNotEmpty
                                  ? GridView.builder(
                                      scrollDirection: Axis.horizontal,
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 2,
                                        mainAxisSpacing: 2,
                                        childAspectRatio: 1,
                                      ),
                                      itemCount: data['image'].length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(data['image'][index],),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                        );
                                      },
                                    )
                                  : Center(
                                      child: MyTextWidget(text: 'Images Unavailable', color: Colors.red, size: screenSize.width/32, weight: FontWeight.bold)
                                    )
                              : AddedCarImages(sellerHomeScreenBloc: editImageBloc)
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
