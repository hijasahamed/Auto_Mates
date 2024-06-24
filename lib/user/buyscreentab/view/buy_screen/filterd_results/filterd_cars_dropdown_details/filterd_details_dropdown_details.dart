import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class FilterdDetailsDropdownDetails extends StatelessWidget {
  const FilterdDetailsDropdownDetails(
      {super.key,
      required this.screenSize,
      required this.car,
      required this.dropdownblocInstance,
      required this.isDropdownVisible,
      required this.index});
  final Size screenSize;
  final dynamic car;
  final BuyScreenBloc dropdownblocInstance;
  final bool isDropdownVisible;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize.width,
      child: Column(
        children: [
          const Divider(
            color: Color.fromARGB(255, 231, 231, 231),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      FilterdDetailsHolder(text: 'Year: ${car['year']}', screenSize: screenSize, image: const AssetImage('assets/images/calender.png'),),
                      FilterdDetailsHolder(text: 'Kilometers: ${car['kilometer']}', screenSize: screenSize, image: const AssetImage('assets/images/kilometers.png'),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      FilterdDetailsHolder(text: 'Insurence: ${car['insurance']}', screenSize: screenSize, image: const AssetImage('assets/images/kilometers.png'),),
                      FilterdDetailsHolder(text: 'Petrol: ${car['fuel']}', screenSize: screenSize, image: const AssetImage('assets/images/fuel.png'),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      FilterdDetailsHolder(text: 'Transmission: ${car['transmission']}', screenSize: screenSize, image: const AssetImage('assets/images/gear.png'),),
                      FilterdDetailsHolder(text: 'Seat: ${car['seat']}', screenSize: screenSize, image: const AssetImage('assets/images/kilometers.png'),),
                    ],
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}

class FilterdDetailsHolder extends StatelessWidget {
  const FilterdDetailsHolder({
    super.key,
    required this.text,
    required this.screenSize,
    required this.image,
  });
  final String text;
  final Size screenSize;
  final ImageProvider image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: screenSize.height / 50,
          width: screenSize.width / 10,
          decoration: BoxDecoration(image: DecorationImage(image: image)),
        ),
        SizedBox(
          height: screenSize.width / 100,
        ),
        MyTextWidget(text: text, color: const Color(0xff424141), size: screenSize.width/30, weight: FontWeight.bold)
      ],
    );
  }
}
