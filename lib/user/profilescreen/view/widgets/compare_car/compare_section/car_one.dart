import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:flutter/material.dart';

class CarOne extends StatelessWidget {
  const CarOne(
      {super.key,
      required this.compareCarsBlocInstance,
      required this.screenSize});
  final Size screenSize;
  final ProfileScreenBloc compareCarsBlocInstance;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              compareCarsBlocInstance.add(
                  NavigateToSelectCarForComaparingPageEvent(boolVal: true));
            },
            child: carForComparing1.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 35,
                        backgroundImage:
                            AssetImage('assets/images/compare car.png'),
                      ),
                      SizedBox(height: screenSize.height/100,),
                      MyTextWidget(
                          text: 'Select car',
                          color: Colors.grey,
                          size: screenSize.width / 28,
                          weight: FontWeight.bold)
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: screenSize.height / 5.5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    carForComparing1[0]['thumbnail']),
                                fit: BoxFit.cover)),
                      ),
                      MyTextWidget(
                          text: carForComparing1[0]['brand'],
                          color: Colors.black,
                          size: screenSize.width / 33,
                          weight: FontWeight.bold),
                      MyTextWidget(
                          text: carForComparing1[0]['modelName'],
                          color: Colors.black,
                          size: screenSize.width / 33,
                          weight: FontWeight.bold),
                      MyTextWidget(
                          text: '₹${carForComparing1[0]['price']} Lakh',
                          color: Colors.black,
                          size: screenSize.width / 33,
                          weight: FontWeight.bold),
                    ],
                  )));
  }
}
