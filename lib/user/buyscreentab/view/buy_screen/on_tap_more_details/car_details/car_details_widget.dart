import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/on_tap_more_details/car_details/all_images/all_images_screen.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/on_tap_more_details/car_details/sections/car_image/car_image.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/on_tap_more_details/car_details/sections/car_overview.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/on_tap_more_details/car_details/sections/details_container.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/on_tap_more_details/car_details/sections/related_cars/related_cars.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/on_tap_more_details/car_details/sections/specification_features_widget.dart';
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (fromSeller== true)? SizedBox(height: screenSize.height/80,) : const Padding(
                padding: EdgeInsets.all(8.0),
                child: MyTextWidget(
                    text: 'Car Details',
                    color: Color(0xFF424141),
                    size: 18,
                    weight: FontWeight.bold),
              ),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextWidget(
                    text: data['brand'],
                    color: Colors.blueGrey,
                    size: screenSize.width/17,
                    weight: FontWeight.bold),
                MyTextWidget(
                    text: data['modelName'],
                    color: const Color(0xFF424141),
                    size: screenSize.width/22,
                    weight: FontWeight.bold),
                Row(
                  children: [
                    MyTextWidget(
                        text: '₹${data['price']}',
                        color: Colors.green,
                        size: screenSize.width/18,
                        weight: FontWeight.bold),
                    MyTextWidget(
                        text: ' Lakh',
                        color: Colors.black,
                        size: screenSize.width/26,
                        weight: FontWeight.w500),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,top: 10),
                  child: DetailsContainer(screenSize: screenSize, data: data),
                ),
                Container(
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 241, 241, 241),
                      borderRadius: BorderRadius.circular(5)),
                  child: SpecificationFeaturesWidget(
                    screenSize: screenSize,
                    data: data,
                  ),
                ),
                CarOverview(data: data),
                (fromSeller == true)? const SizedBox.shrink() : RelatedCars(data: data,screenSize: screenSize,)
              ],
            ),
          ],
        );
      },
    );
  }
}
