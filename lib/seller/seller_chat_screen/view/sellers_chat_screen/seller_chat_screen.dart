import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/seller/seller_chat_screen/controller/seller_chat_controller.dart';
import 'package:auto_mates/seller/seller_chat_screen/view/sellers_chat_screen/seller_chat_screen_chats_holder/seller_chat_screen_chats_holder.dart';
import 'package:auto_mates/user/chatscreen/view/user_chat_screen/users_no_chat_display/users_no_chat_display.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/commonwidgets/shimmer_effect/shimmer_effect.dart';
import 'package:flutter/material.dart';

class SellerChatScreen extends StatelessWidget {
  const SellerChatScreen({super.key,required this.screenSize,required this.currentSeller});
  final Size screenSize;
  final SellerData currentSeller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<List<String>>(
        stream: getTheCurrentSellersChatsWithUsers(currentSellerId: currentSeller.id), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
          } else if (snapshot.hasError) {
            return Center(
              child: MyTextWidget(
                text: 'Something Went Wrong',
                color: Colors.blueGrey,
                size: screenSize.width / 30,
                weight: FontWeight.bold,
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return UsersNoChatDisplay(screenSize: screenSize);
          }
          else{
            var usersIds = snapshot.data!;            
            return ListView.builder(
              itemCount: usersIds.length,
              itemBuilder: (context, index) {
                var id = usersIds[index];
                return FutureBuilder(
                  future: getUserDetailsById(id), 
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SkelotonChatLoader(screenSize: screenSize);                      
                    } else if (snapshot.hasError) {
                      return const SizedBox.shrink();
                    } else if (!snapshot.hasData) {
                      return const SizedBox.shrink();
                    }else{
                      var userData = snapshot.data!;
                      return SellerChatScreenChatsHolder(screenSize: screenSize,userdata: userData,currentSeller: currentSeller,);
                    }
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}