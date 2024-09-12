import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/on_tap_more_details/car_details/all_images/image_zoom_widget/image_zoom_screen.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/on_tap_more_details/car_details/all_images/screen_app_bar/all_images_screen_app_bar.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/on_tap_more_details/car_details/all_images/screen_bottom_bar/all_images_screen_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllImagesScreen extends StatefulWidget {
  const AllImagesScreen(
      {super.key, required this.data, required this.screenSize});
  final dynamic data;
  final Size screenSize;

  @override
  State<AllImagesScreen> createState() => _AllImagesScreenState();
}

class _AllImagesScreenState extends State<AllImagesScreen> {
  BuyScreenBloc blocInstance = BuyScreenBloc();
  PageController pageController = PageController();
  int selectedIndex = 0;
  @override
  void initState() {
    pageController.addListener(
      () {
        int newIndex = pageController.page?.round() ?? 0;
        if (selectedIndex != newIndex) {
          selectedIndex = newIndex;
          blocInstance.add(AllImageIndexCheckingEvent());
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: BlocBuilder<BuyScreenBloc, BuyScreenState>(
            bloc: blocInstance,
            builder: (context, state) {
              return AllImagesScreenAppBar(
                  data: widget.data,
                  blocInstance: blocInstance,
                  selectedIndex: selectedIndex);
            },
          )),
      body: BlocConsumer<BuyScreenBloc, BuyScreenState>(
        bloc: blocInstance,
        listener: (context, state) {
          if(state is ImageZoomingScreenNavigateState){
             Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ImageZoomScreen(imageUrl: widget.data['image'][state.index]);
              },));
          }
        },
        builder: (context, state) {
          return PageView.builder(
            padEnds: true,
            controller: pageController,
            onPageChanged: (value) {
              blocInstance.add(AllImageIndexCheckingEvent());
            },
            itemCount: widget.data['image'].length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                 blocInstance.add(ImageZoomingScreenNavigateEvent(index: index));
                },
                child: Image.network(
                  widget.data['image'][index],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<BuyScreenBloc, BuyScreenState>(
        bloc: blocInstance,
        builder: (context, state) {
          return AllImagesScreenBottomBar(
            screenSize: widget.screenSize,
            data: widget.data,
            blocInstance: blocInstance,
            selectedIndex: selectedIndex,
            pageController: pageController,
          );
        },
      ),
    );
  }
}
