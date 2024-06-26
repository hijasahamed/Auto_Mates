import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/car_holder/car_holder.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/commonwidgets/shimmer_effect/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCarsToSellWidget extends StatelessWidget {
  const AllCarsToSellWidget({
    super.key,
    required this.screenSize,
    required this.sellerHomeScreenBloc,
    required this.sellerId,
  });

  final Size screenSize;
  final SellerHomeScreenBloc sellerHomeScreenBloc;
  final String sellerId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SellerHomeScreenBloc, SellerHomeScreenState>(
      bloc: refreshAllCarToSellInstance,
      listener: (context, state) {
        if(state is MarkCarSoldStopLoadingState){
          return Navigator.pop(context);
        }
      },      
      builder: (context, state) {
        return FutureBuilder<List>(
          future: getCarsBySellerId(sellerId: sellerId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SkelotonIndicatorGrid(screenSize: screenSize);
            }
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: .72,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final carData = snapshot.data![index];
                  return CarHolder(
                    screenSize: screenSize,
                    data: carData,
                    isFromSeller: true,
                    sellerHomeScreenBloc: sellerHomeScreenBloc,
                  );
                },
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: screenSize.height / 4.5,
                    width: screenSize.width / 1.2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/no car to sell.avif',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const MyTextWidget(
                    text: 'No cars left for selling',
                    color: Colors.black,
                    size: 17,
                    weight: FontWeight.w500,
                  ),
                  const MyTextWidget(
                    text: 'Please post new cars by clicking the + button',
                    color: Colors.black,
                    size: 17,
                    weight: FontWeight.w500,
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }
}
