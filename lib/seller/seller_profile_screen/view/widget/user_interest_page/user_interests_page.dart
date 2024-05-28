import 'package:auto_mates/seller/seller_profile_screen/view/widget/user_interest_page/interest_data_holder/interest_holder.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/commonwidgets/no_data_error_placeholder/no_data_error_placeholder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserInterestsPage extends StatelessWidget {
  const UserInterestsPage({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: userInterestMarked.orderBy('userName').snapshots(),  
      builder: (context, AsyncSnapshot snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(color: Colors.blue,));
        }
        if(snapshot.hasData && snapshot.data.docs.isNotEmpty){
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(50), 
              child: NormalAppBar(title: 'User Interest')
            ),
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot data = snapshot.data.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InterestHolder(screenSize: screenSize,data: data)
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
    );
  }
}