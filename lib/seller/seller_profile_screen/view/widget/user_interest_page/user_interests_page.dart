import 'package:auto_mates/seller/seller_profile_screen/controllers/functions.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/user_interest_page/interest_holder_datas/interest_holder.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/commonwidgets/no_data_error_placeholder/no_data_error_placeholder.dart';
import 'package:auto_mates/user/commonwidgets/shimmer_effect/shimmer_effect.dart';
import 'package:flutter/material.dart';

class UserInterestsPage extends StatelessWidget {
  const UserInterestsPage({super.key,required this.screenSize,required this.sellerData});
  final Size screenSize;
  final dynamic sellerData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: getUsersInterestsWithSellerId(sellerData.id),  
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Scaffold(
              appBar: const PreferredSize(
                preferredSize: Size.fromHeight(50), 
                child: NormalAppBar(title: 'User Interest')
              ),
              body: SkelotonIndicatorList(screenSize: screenSize,itemCount: 6,)
            );
          }
          if(snapshot.hasData && snapshot.data.docs.isNotEmpty){
            final cars= snapshot.data!.docs;
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: const PreferredSize(
                preferredSize: Size.fromHeight(50), 
                child: NormalAppBar(title: 'User Interest')
              ),
              body: ListView.builder(
                shrinkWrap: true,
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  var car = cars[index]; 
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InterestHolder(screenSize: screenSize,data: car)
                  );
                },
              ),
            );
          }         
          else{
            return Scaffold(
              appBar: const PreferredSize(
                preferredSize: Size.fromHeight(50), 
                child: NormalAppBar(title: 'User Interest')
              ),
              body: NoDataErrorPlaceholder(screenSize: screenSize, titleText: 'No User Interests'),
            );
          }
        },
      ),
    );
  }
}