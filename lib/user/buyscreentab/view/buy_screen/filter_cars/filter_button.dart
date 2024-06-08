import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/buy_screen.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_cars/filter_screen/filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BuyScreenBloc, BuyScreenState>(
      bloc: buyScreenBloc,
      listener: (context, state) {
        if(state is FilterButtonClickedState){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FilterScreen(screenSize: screenSize,)
          ));
        }
                
      },
      builder: (context, state) {
        return IconButton(
            onPressed: () {
              buyScreenBloc.add(FilterButtonClickedEvent());
            },
            icon: const Icon(
              Icons.sort_rounded,
              color: Colors.white,
              size: 35,
            ));
      },
    );
  }
}
