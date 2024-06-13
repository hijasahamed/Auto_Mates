import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllImagesScreenBottomBar extends StatelessWidget {
  const AllImagesScreenBottomBar(
      {super.key,
      required this.screenSize,
      required this.data,
      required this.blocInstance,
      required this.selectedIndex,
      required this.pageController});
  final Size screenSize;
  final dynamic data;
  final BuyScreenBloc blocInstance;
  final int selectedIndex;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuyScreenBloc, BuyScreenState>(
      bloc: blocInstance,
      builder: (context, state) {
        return BottomAppBar(
          color: Colors.white,
          child: SizedBox(
            height: screenSize.height / 11,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data['image'].length,
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
                          color: isSelected ? Colors.blue : Colors.transparent,
                          width: 3,
                        ),
                      ),
                      margin: const EdgeInsets.all(5),
                      child: Image.network(
                        data['image'][index],
                        height: screenSize.height / 12,
                        width: screenSize.width / 7,
                        fit: BoxFit.cover,
                      ),
                    ));
              },
            ),
          ),
        );
      },
    );
  }
}
