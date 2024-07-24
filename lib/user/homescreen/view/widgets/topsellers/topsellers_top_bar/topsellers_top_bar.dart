import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/homescreen/view/bloc/homescreen_bloc.dart';
import 'package:flutter/material.dart';

class TopsellersTopBar extends StatelessWidget {
  const TopsellersTopBar({super.key,required this.screenSize,required this.homescreenBloc});
  final Size screenSize;
  final HomescreenBloc homescreenBloc;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyTextWidget(
          text: 'Top sellers', 
          color: const Color(0xff424141), 
          size: screenSize.width/16.5,
            weight: FontWeight.bold
        ),
        TextButton(
          onPressed: (){
            homescreenBloc.add(TopSellersAllListNavigateEvent());
          }, 
          child: MyTextWidget(text: 'View All', color: Colors.blue, size: screenSize.width/35, weight: FontWeight.bold) )
      ],
    );
  }
}