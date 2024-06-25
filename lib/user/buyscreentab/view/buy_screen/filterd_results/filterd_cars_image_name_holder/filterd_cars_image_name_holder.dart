import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class FilterdCarsImageNameHolder extends StatelessWidget {
  const FilterdCarsImageNameHolder(
      {super.key,
      required this.screenSize,
      required this.car,
      required this.dropdownblocInstance,
      required this.isDropdownVisible,
      required this.indexofButton,
      required this.index});
  final Size screenSize;
  final dynamic car;
  final BuyScreenBloc dropdownblocInstance;
  final bool isDropdownVisible;
  final int index;
  final int? indexofButton;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height / 8,
      width: screenSize.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: screenSize.width / 2.7,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5)
                  ),
                  image: DecorationImage(
                      image: NetworkImage(car['thumbnail']), fit: BoxFit.cover)),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextWidget(
                  text: car['brand'],
                  color: Colors.grey,
                  size: 13,
                  weight: FontWeight.bold),
              MyTextWidget(
                  text: car['modelName'],
                  color: const Color(0xff424141),
                  size: 15,
                  weight: FontWeight.bold),
            ],
          ),
          IconButton(
              onPressed: () {
                dropdownblocInstance.add(FilterdCarDropdownButtonRefreshEvent(
                    isDropdownVisible: !isDropdownVisible, index: index));
              },
              icon: Icon(
                (isDropdownVisible == true && indexofButton == index)
                    ? Icons.arrow_drop_up_rounded
                    : Icons.arrow_drop_down_rounded,
                size: 35,
                color: Colors.grey,
              )),
        ],
      ),
    );
  }
}
