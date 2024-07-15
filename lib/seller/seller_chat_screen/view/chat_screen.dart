import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/seller/seller_chat_screen/controller/functions.dart';
import 'package:auto_mates/user/chatscreen/view/user_chat_screen/users_no_chat_display/users_no_chat_display.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/commonwidgets/shimmer_effect/shimmer_effect.dart';
import 'package:flutter/material.dart';

class SellerChatScreen extends StatelessWidget {
  const SellerChatScreen({super.key,required this.screenSize,required this.currentSellerId});
  final Size screenSize;
  final SellerData currentSellerId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<List<String>>(
        stream: getSellersChatsWithUsersStream(currentSellerId: currentSellerId.id), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
          } else if (snapshot.hasError) {
            return Center(
              child: MyTextWidget(
                text: 'Something Went Wrong',
                color: Colors.black,
                size: screenSize.width / 30,
                weight: FontWeight.bold,
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return UsersNoChatDisplay(screenSize: screenSize);
          }
          else{
            var usersIds = snapshot.data!;
            // return FutureBuilder(
            //   future: future, 
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return SkelotonChatLoader(screenSize: screenSize);                      
            //     } else if (snapshot.hasError) {
            //       return const ListTile(
            //         title: Text('Error loading seller details'),
            //       );
            //     } else if (!snapshot.hasData) {
            //       return const SizedBox.shrink();
            //     }else{

            //     }
            //   },
            // );
          }
          return Text('hi');
        },
      ),
    );
  }
}