import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllImagesScreenAppBar extends StatelessWidget {
  const AllImagesScreenAppBar({super.key,required this.data,required this.blocInstance,required this.selectedIndex});
  final dynamic data;
  final BuyScreenBloc blocInstance;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.clear,
              size: 25,
              color: Colors.grey,
            )),
        title: BlocBuilder<BuyScreenBloc, BuyScreenState>(
          bloc: blocInstance,
          builder: (context, state) {
            int displayedIndex = selectedIndex + 1;
            return Row(
              children: [
                MyTextWidget(
                    text: displayedIndex.toString(),
                    color: Colors.grey,
                    size: 20,
                    weight: FontWeight.w600),
                    MyTextWidget(
                    text: '/${data['image'].length}',
                    color: Colors.grey,
                    size: 18,
                    weight: FontWeight.w600),
              ],
            );
          },
        ),
      );
  }
}