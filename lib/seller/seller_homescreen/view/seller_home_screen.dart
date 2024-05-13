import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_car_widget.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/all_cars_to_sell_widget.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/floating_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerHomeScreen extends StatelessWidget {
  const SellerHomeScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final SellerHomeScreenBloc sellerHomeScreenBloc = SellerHomeScreenBloc();
    return BlocConsumer<SellerHomeScreenBloc, SellerHomeScreenState>(
      bloc: sellerHomeScreenBloc,
      listener: (context, state) {
        if(state is FloatingButtonClickedActionState){
           Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddCarWidget()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: AllCarsToSellWidget(
                    screenSize: screenSize,
                  ),
                ),
                Positioned(
                    bottom: 50,
                    right: 20,
                    child: FloatingButtonWidget(screenSize: screenSize,sellerHomeScreenBloc: sellerHomeScreenBloc,))
              ],
            ),
          ),
        );
      },
    );
  }
}
