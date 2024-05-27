import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/popup_menu_button_widget.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/single_car_details/single_car_details_screen.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/seller_details/seller_details_screen.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:auto_mates/user/favourite_screen/controller/functions.dart';
import 'package:flutter/material.dart';

class CarHolder extends StatefulWidget {
  const CarHolder(
      {super.key,
      required this.screenSize,
      required this.data,
      this.sellerHomeScreenBloc,
      this.isFromUser,
      this.isFromSeller});
  final Size screenSize;
  final dynamic data;
  final bool? isFromSeller;
  final SellerHomeScreenBloc? sellerHomeScreenBloc;
  final bool? isFromUser;

  @override
  State<CarHolder> createState() => _CarHolderState();
}

class _CarHolderState extends State<CarHolder> {

  final ValueNotifier<bool> isFavOrNotValueNotifier = ValueNotifier(false);

  @override
  void initState() {
    checkIfFavourite(isFavOrNotValueNotifier: isFavOrNotValueNotifier,id: widget.data.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: GestureDetector(
        onTap: () {
          (widget.isFromSeller == true)
              ? Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SingleCarDetailsScreen(
                        screenSize: widget.screenSize,
                        data: widget.data,
                        sellerHomeScreenBloc: widget.sellerHomeScreenBloc,
                      )))
              : Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return SellerDetailsScreen(
                      screenSize: widget.screenSize,
                      data: widget.data,
                    );
                  },
                ));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: .5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: FadeInImage(
                        fadeInDuration: const Duration(milliseconds: 750),
                        height: widget.screenSize.height / 5,
                        width: widget.screenSize.width,
                        placeholder: const AssetImage(
                          'assets/images/image placeholder.jpeg',
                        ),
                        placeholderFit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return const CircularProgressIndicator(
                            color: Colors.blue,
                          );
                        },
                        image: NetworkImage(widget.data['image']),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: (widget.isFromSeller == true)
                    ? CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: PopupMenuButtonWidget(
                            screenSize: widget.screenSize,
                            data: widget.data,
                            sellerHomeScreenBloc: widget.sellerHomeScreenBloc))
                    : (widget.isFromUser == true)
                        ? GestureDetector(
                            onTap: () {
                              addCarToUserFavourite(
                                  data: widget.data, context: context);
                            },
                            child: ValueListenableBuilder(
                              valueListenable: isFavOrNotValueNotifier, 
                              builder: (context, value, child) {
                                return  CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 15,
                                  child: Icon(
                                    value ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                );
                              },
                            )
                          )
                        : GestureDetector(
                            onTap: () {
                              removeFavoriteCar(
                                  docId: widget.data.id, context: context);
                            },
                            child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 15,
                              child: Icon(
                                Icons.delete,
                                size: 20,
                                color: Colors.red,
                              ),
                            ),
                          )
                      )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Row(
                  children: [
                    MyTextWidget(
                        text: '${widget.data['brand']}',
                        color: Colors.black,
                        size: 15,
                        weight: FontWeight.bold),
                    SizedBox(
                      width: widget.screenSize.width / 100,
                    ),
                    Expanded(
                        child: MyTextWidget(
                            text: '${widget.data['modelName']}',
                            color: Colors.black,
                            size: 15,
                            weight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: MyTextWidget(
                    text: '${widget.data['year']} model',
                    color: Colors.black,
                    size: 15,
                    weight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: MyTextWidget(
                    text: '${widget.data['kilometer']} kilometers',
                    color: Colors.black,
                    size: 15,
                    weight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: MyTextWidget(
                    text: 'Rs. ${widget.data['price']} onwards',
                    color: Colors.black,
                    size: 15,
                    weight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
