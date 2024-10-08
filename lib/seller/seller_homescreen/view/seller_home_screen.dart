
import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/add_car_edit_car_widget.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/all_cars_to_sell/all_cars_to_sell_widget.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/floating_button/floating_button_widget.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/single_car_details/single_car_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerHomeScreen extends StatelessWidget {
  const SellerHomeScreen({
    super.key,
    required this.data
  });
  final SellerData data;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final SellerHomeScreenBloc sellerHomeScreenBloc = SellerHomeScreenBloc();
    return BlocConsumer<SellerHomeScreenBloc, SellerHomeScreenState>(
      bloc: sellerHomeScreenBloc,
      listener: (context, state) {
        if(state is FloatingButtonClickedActionState){
           Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddCarEditCarWidget(screenSize: screenSize,sellerHomeScreenBloc: sellerHomeScreenBloc,isEditPage: false,)));
        }
        else if(state is BackArrowClickedActionState){
          Navigator.of(context).pop();
        }        
        else if(state is NavigateToSingleCarDetailsPageActionState){
         Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SingleCarDetailsScreen(
              screenSize:screenSize,
              data: state.data,
              sellerData: data,
              sellerHomeScreenBloc: sellerHomeScreenBloc,
          )));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 254, 254),
          body: SafeArea(
            child: Stack(
              children: [
                SizedBox(
                  height: screenSize.height,
                  width: screenSize.width,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: AllCarsToSellWidget(
                      screenSize: screenSize,
                      sellerHomeScreenBloc: sellerHomeScreenBloc,
                      sellerId: data.id,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 50,
                    right: 20,
                    child: FloatingButtonWidget(screenSize: screenSize,sellerHomeScreenBloc: sellerHomeScreenBloc,data: data,))
              ],
            ),
          ),
        );
      },
    );
  }
}
