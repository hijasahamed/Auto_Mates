import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/car_details/all_images/screen_app_bar/all_images_screen_app_bar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
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
      body: BlocBuilder<BuyScreenBloc, BuyScreenState>(
        bloc: blocInstance,
        builder: (context, state) {
          return PageView.builder(
            padEnds: true,
            controller: pageController,
            onPageChanged: (value) {
              blocInstance.add(AllImageIndexCheckingEvent());
            },
            itemCount: widget.data['image'].length,
            itemBuilder: (context, index) {
              return Image.network(
                widget.data['image'][index],
              );
            },
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<BuyScreenBloc, BuyScreenState>(
        bloc: blocInstance,
        builder: (context, state) {
          return BottomAppBar(
            color: Colors.white,
            child: SizedBox(
              height: widget.screenSize.height / 11,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.data['image'].length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;
                  return GestureDetector(
                      onTap: () {
                        pageController.jumpToPage(index);
                        blocInstance.add(AllImageIndexCheckingEvent());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color:
                                isSelected ? Colors.blue : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        margin: const EdgeInsets.all(5),
                        child: Image.network(
                          widget.data['image'][index],
                          height: widget.screenSize.height / 12,
                          width: widget.screenSize.width / 7,
                          fit: BoxFit.cover,
                        ),
                      ));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
