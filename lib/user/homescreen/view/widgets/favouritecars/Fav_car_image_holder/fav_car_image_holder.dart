import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/homescreen/view/bloc/homescreen_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavCarImageHolder extends StatelessWidget {
  const FavCarImageHolder({
    super.key,
    required this.carouselController,
    required this.cars,
    required this.screenSize,
  });
  final Size screenSize;
  final dynamic cars;
  final CarouselController carouselController;
  @override
  Widget build(BuildContext context) {
    HomescreenBloc refreshCarosalBlocInstance = HomescreenBloc();
    int currentIndex = 0;
    return BlocBuilder<HomescreenBloc, HomescreenState>(
      bloc: refreshCarosalBlocInstance,
      builder: (context, state) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              CarouselSlider.builder(
                carouselController: carouselController,
                itemCount: cars.length,
                itemBuilder: (context, index, realIndex) {
                  final imageUrl = cars[index]['thumbnail'];
                  return SizedBox(
                    width: screenSize.width,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, exception, stackTrace) {
                        return const Text('No Image');
                      },
                    ),
                  );
                },
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    currentIndex = index;
                    refreshCarosalBlocInstance.add(RefreshFavouriteCarosalEvent());
                  },
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 1,
                  height: screenSize.height / 4.9,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: cars.length > 1,
                ),
              ),
              Positioned(
                bottom: screenSize.width / 50,
                left: screenSize.width / 50,
                child: Container(
                    padding: EdgeInsets.all(screenSize.width / 100),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius:
                          BorderRadius.circular(screenSize.width / 100),
                    ),
                    child: Row(
                      children: [
                        MyTextWidget(
                            text: cars[currentIndex]['brand'] ?? 'Unknown',
                            color: Colors.white,
                            size: screenSize.width / 30,
                            weight: FontWeight.w400),
                        SizedBox(
                          width: screenSize.width / 100,
                        ),
                        MyTextWidget(
                            text: cars[currentIndex]['modelName'] ?? 'Unknown',
                            color: Colors.white,
                            size: screenSize.width / 30,
                            weight: FontWeight.w400),
                      ],
                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}
