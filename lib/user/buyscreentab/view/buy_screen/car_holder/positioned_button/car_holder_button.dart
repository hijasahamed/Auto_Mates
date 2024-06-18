import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/all_cars_to_sell/pop_up_button/popup_menu_button_widget.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/car_holder/fav_icon/favourite_icon.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:flutter/material.dart';

class CarHolderButton extends StatelessWidget {
  const CarHolderButton({super.key,this.isFromUser,this.isFromSeller,required this.data,required this.screenSize,this.sellerHomeScreenBloc});
  final bool? isFromUser;
  final bool? isFromSeller;
  final SellerHomeScreenBloc? sellerHomeScreenBloc;
  final dynamic data;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Positioned(
                      top: 0,
                      right: 0,
                      child: (isFromSeller == true)
                          ? CircleAvatar(
                              backgroundColor: Colors.black12,
                              child: PopupMenuButtonWidget(
                                  screenSize: screenSize,
                                  data: data,
                                  sellerHomeScreenBloc: sellerHomeScreenBloc))
                          : (isFromUser == true)
                              ? FavouriteIcon(
                                  data: data,
                                  isFromSearch: false,
                                )
                              : IconButton(
                                  style: const ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                    Colors.black26,
                                  )),
                                  constraints: const BoxConstraints(
                                      maxHeight: 30, maxWidth: 30),
                                  onPressed: () {
                                    removeFavoriteCar(
                                        docId: data.id, context: context);
                                  },
                                  icon: const Icon(
                                    Icons.clear_rounded,
                                    size: 14,
                                    color: Colors.white,
                                  )));
  }
}