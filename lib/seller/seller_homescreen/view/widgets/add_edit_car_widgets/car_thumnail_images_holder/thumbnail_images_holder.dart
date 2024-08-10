import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/car_images/added_car_images.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/car_images/preview_selected_cars/preview_cars_widget.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/thumbnail_image/added_thumbnail_image.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThumbnailImagesHolder extends StatelessWidget {
  const ThumbnailImagesHolder(
      {super.key, required this.screenSize, required this.homescreenBloc});
  final Size screenSize;
  final SellerHomeScreenBloc homescreenBloc;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BlocBuilder<SellerHomeScreenBloc, SellerHomeScreenState>(
              bloc: homescreenBloc,
              builder: (context, state) {
                return Row(
                  children: [
                    thumbnailImage != null
                        ? MyTextWidget(
                            text: 'Thumbnail',
                            color: Colors.blueGrey,
                            size: screenSize.width / 35,
                            weight: FontWeight.w400)
                        : const SizedBox.shrink(),
                    SizedBox(width: screenSize.width/3,),
                    selectedImages.isNotEmpty
                        ? MyTextWidget(
                            text: 'Long press to see images',
                            color: Colors.blueGrey,
                            size: screenSize.width / 35,
                            weight: FontWeight.w400)
                        : const SizedBox.shrink(),
                  ],
                );
              },
            ),
            Container(
              height: screenSize.height / 6,
              width: screenSize.width,
              color: Colors.transparent,
              child: Row(
                children: [
                  BlocBuilder<SellerHomeScreenBloc, SellerHomeScreenState>(
                    bloc: homescreenBloc,
                    builder: (context, state) {
                      return Expanded(
                        child: Ink(
                          height: screenSize.height / 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(screenSize.width/100),
                            color: const Color.fromARGB(255, 243, 243, 243),
                          ),
                          child: InkWell(
                              onTap: () {
                                addCarThumbnail(bloc: homescreenBloc);
                              },
                              child: thumbnailImage == null
                                  ? Center(
                                      child: MyTextWidget(
                                          text: 'Add Thumbnail',
                                          color: Colors.black,
                                          size: screenSize.width/32,
                                          weight: FontWeight.w300))
                                  : AddedThumbnailImage(
                                      screenSize: screenSize)),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: screenSize.width / 110,
                  ),
                  BlocBuilder<SellerHomeScreenBloc, SellerHomeScreenState>(
                    bloc: homescreenBloc,
                    builder: (context, state) {
                      return Expanded(
                        child: Ink(
                          height: screenSize.height / 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 243, 243, 243),
                          ),
                          child: InkWell(
                              onTap: () {
                                addMultipleImages(bloc: homescreenBloc);
                              },
                              onLongPress: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return PreviewCarsWidget(
                                      screenSize: screenSize,
                                    );
                                  },
                                ));
                              },
                              child: selectedImages.isEmpty
                                  ? Center(
                                      child: MyTextWidget(
                                          text: 'Add Car Images',
                                          color: Colors.black,
                                          size: screenSize.width/32,
                                          weight: FontWeight.w300))
                                  : AddedCarImages(
                                      sellerHomeScreenBloc: homescreenBloc,
                                    )),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
