import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/buy_screen.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/car_details/all_images/all_images_screen.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/car_details/sections/car_image.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/car_details/sections/details_container.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/car_details/sections/specification_features_widget.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarDetailsWidget extends StatelessWidget {
  const CarDetailsWidget({
    super.key,
    required this.screenSize,
    required this.data,
    this.fromSeller,
    this.isFromSearch,
    this.isUserFavScreen,
  });
  final Size screenSize;
  final dynamic data;
  final bool? fromSeller;
  final bool? isFromSearch;
  final bool? isUserFavScreen;
  @override
  Widget build(BuildContext context) {
    BuyScreenBloc blocInstance = BuyScreenBloc();
    return BlocConsumer<BuyScreenBloc, BuyScreenState>(
      bloc: blocInstance,
      listener: (context, state) {
        if(state is ShowAllCarImagesState){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AllImagesScreen(data: data,screenSize: screenSize,);
          },));
        }
      },
      builder: (context, state) {
        return Card(
          color: const Color(0xFFDBEDF5),
          elevation: 5,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  blocInstance.add(ShowAllCarImagesEvent());
                },
                child: CarImage(
                  screenSize: screenSize,
                  data: data,
                  fromSeller: fromSeller,
                  isFromSearch: isFromSearch,
                  isUserFavScreen: isUserFavScreen,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextWidget(
                        text: data['brand'],
                        color: const Color(0xFF424141),
                        size: 23,
                        weight: FontWeight.bold),
                    MyTextWidget(
                        text: data['modelName'],
                        color: const Color(0xFF424141),
                        size: 17,
                        weight: FontWeight.bold),
                    SizedBox(
                      height: screenSize.height / 90,
                    ),
                    DetailsContainer(screenSize: screenSize, data: data),
                    SizedBox(
                      height: screenSize.height / 90,
                    ),
                    Container(
                      height: screenSize.height / 2,
                      width: screenSize.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10, top: 5),
                            child: Text(
                              'Specifications & Features',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF424141)),
                            ),
                          ),
                          SpecificationFeaturesWidget(
                            screenSize: screenSize,
                            data: data,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
