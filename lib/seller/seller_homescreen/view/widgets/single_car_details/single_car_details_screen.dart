import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/car_details/car_details_widget.dart';
import 'package:auto_mates/user/commonwidgets/custom_alertdialog/custom_alert_dialog.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleCarDetailsScreen extends StatelessWidget {
  const SingleCarDetailsScreen(
      {super.key,
      required this.screenSize,
      required this.data,
      required this.sellerHomeScreenBloc});
  final Size screenSize;
  final dynamic data;
  final SellerHomeScreenBloc? sellerHomeScreenBloc;
  @override
  Widget build(BuildContext context) {
    SellerHomeScreenBloc markCarsoldBloc = SellerHomeScreenBloc();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: NormalAppBar(
          title: 'Car Details',
          isFromSeller: true,
          sellerHomeScreenBloc: sellerHomeScreenBloc,
          data: data,
          screenSize: screenSize,
          isFromCarDetailsAppBar: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CarDetailsWidget(
            screenSize: screenSize,
            data: data,
            fromSeller: true,
          ),
        ),
      ),
      bottomNavigationBar: BlocConsumer<SellerHomeScreenBloc, SellerHomeScreenState>(
        bloc: markCarsoldBloc,
        listener: (context, state) {
          if(state is MarkCarSoldLoadingState){
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextWidget(text: 'Marking Car As Sold', color: Colors.white, size: screenSize.width/25, weight: FontWeight.bold),
                    SizedBox(height: screenSize.height/25,),
                    const CircularProgressIndicator(color: Colors.blue,)
                  ],
                );
              },
            );
          }          
        },
        builder: (context, state) {
          return BottomAppBar(
            color: Colors.white,
            height: screenSize.height / 11,
            child: Ink(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 218, 44, 25)),
              child: InkWell(
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => CustomAlertDialog(
                        image: 'assets/images/sold-out.png',
                        title: 'Mark Car To Sold',
                        subtitle:
                            'Do you want to mark this car as sold. This will remove the car for buyers',
                        screenSize: screenSize,
                        markCarAsSold: true,
                        markCarAsSoldData: data,
                        markCarsoldBloc: markCarsoldBloc,
                        sellerHomeScreenBloc: sellerHomeScreenBloc,
                      ),
                    );
                  },
                  child: Center(
                      child: MyTextWidget(
                          text: 'Mark as Sold Cars',
                          color: Colors.white,
                          size: screenSize.width / 27,
                          weight: FontWeight.bold))),
            ),
          );
        },
      ),
    );
  }
}
