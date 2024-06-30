import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:flutter/material.dart';

class CarComparedScreen extends StatelessWidget {
  const CarComparedScreen({super.key,required this.screenSize,required this.compareCarsBlocInstance,required this.previousComparisonBlocInstance});
  final Size screenSize;
  final ProfileScreenBloc compareCarsBlocInstance;
  final ProfileScreenBloc previousComparisonBlocInstance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55), 
        child: NormalAppBar(title: '${carForComparing1[0]['modelName']} v/s ${carForComparing2[0]['modelName']}',isCompare: true,compareCarsBlocInstance: compareCarsBlocInstance,previousComparisonBlocInstance: previousComparisonBlocInstance,)
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height/5.3,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(carForComparing1[0]['thumbnail']),fit: BoxFit.cover),
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5))
                      ),
                    )
                  ),
                  SizedBox(width: screenSize.width/130,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(carForComparing2[0]['thumbnail']),fit: BoxFit.cover),
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5))
                      ),
                    )
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ComparisonHolder(title: 'Brand Name', screenSize: screenSize, car1: carForComparing1[0]['brand'], car2: carForComparing2[0]['brand']),
                      ComparisonHolder(title: 'Model Name', screenSize: screenSize, car1: carForComparing1[0]['modelName'], car2: carForComparing2[0]['modelName']),
                      ComparisonHolder(title: 'Body Type', screenSize: screenSize, car1: carForComparing1[0]['bodytype'], car2: carForComparing2[0]['bodytype']),
                      ComparisonHolder(title: 'Color', screenSize: screenSize, car1: carForComparing1[0]['color'], car2: carForComparing2[0]['color']),
                      ComparisonHolder(title: 'Seat Capacity', screenSize: screenSize, car1: carForComparing1[0]['seat'], car2: carForComparing2[0]['seat']),
                      ComparisonHolder(title: 'Transmission', screenSize: screenSize, car1: carForComparing1[0]['transmission'], car2: carForComparing2[0]['transmission']),
                      ComparisonHolder(title: 'Insurance Till', screenSize: screenSize, car1: carForComparing1[0]['insurance'], car2: carForComparing2[0]['insurance']),
                      ComparisonHolder(title: 'Fuel', screenSize: screenSize, car1: carForComparing1[0]['fuel'], car2: carForComparing2[0]['fuel']),
                      ComparisonHolder(title: 'Fuel Tank (in liters)', screenSize: screenSize, car1: carForComparing1[0]['fueltank'], car2: carForComparing2[0]['fueltank']),
                      ComparisonHolder(title: 'kilometers', screenSize: screenSize, car1: carForComparing1[0]['kilometer'], car2: carForComparing2[0]['kilometer']),
                      ComparisonHolder(title: 'Airbag', screenSize: screenSize, car1: carForComparing1[0]['airbag'], car2: carForComparing2[0]['airbag']),
                      ComparisonHolder(title: 'Boot Space(in liters)', screenSize: screenSize, car1: carForComparing1[0]['bootspace'], car2: carForComparing2[0]['bootspace']),
                      ComparisonHolder(title: 'Ground Clearence(in mm)', screenSize: screenSize, car1: carForComparing1[0]['groundclearance'], car2: carForComparing2[0]['groundclearance']),
                      ComparisonHolder(title: 'Milage(in Km)', screenSize: screenSize, car1: carForComparing1[0]['milage'], car2: carForComparing2[0]['milage']),
                      ComparisonHolder(title: 'No.of.Owner', screenSize: screenSize, car1: carForComparing1[0]['noOfOwners'], car2: carForComparing2[0]['noOfOwners']),
                      ComparisonHolder(title: 'Model Year', screenSize: screenSize, car1: carForComparing1[0]['year'], car2: carForComparing2[0]['year']),
                      ComparisonHolder(title: 'Price', screenSize: screenSize, car1: carForComparing1[0]['price'], car2: carForComparing2[0]['price']),
                    ],
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}

class ComparisonHolder extends StatelessWidget {
  const ComparisonHolder({super.key,required this.title,required this.screenSize,required this.car1,required this.car2});
  final Size screenSize;
  final String title;
  final String car1;
  final String car2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(border: Border.all(width: .9,color: Color.fromARGB(255, 213, 213, 213))),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyTextWidget(text: title, color: const Color.fromARGB(255, 106, 106, 106), size: screenSize.width/27, weight: FontWeight.bold),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyTextWidget(text: car1, color: const Color.fromARGB(255, 9, 114, 132), size: screenSize.width/28, weight: FontWeight.bold),
                  MyTextWidget(text: car2, color: const Color.fromARGB(255, 9, 114, 132), size: screenSize.width/28, weight: FontWeight.bold),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}