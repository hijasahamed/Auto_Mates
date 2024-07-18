import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/chatscreen/controller/chat_controller/chat_controller.dart';
import 'package:auto_mates/user/chatscreen/view/user_chat_screen/users_chats_holder/users_chats_holder.dart';
import 'package:auto_mates/user/chatscreen/view/user_chat_screen/users_no_chat_display/users_no_chat_display.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/commonwidgets/shimmer_effect/shimmer_effect.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserChatScreen extends StatelessWidget {
  const UserChatScreen({super.key, required this.screenSize,required this.userData});
  final Size screenSize;
  final UserData userData;
  @override
  Widget build(BuildContext context) {
    final String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    final ChatController chatController = ChatController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<List<String>>(
        stream: getChatsListOfUsersWithSellers(currentUserId: currentUserId,),
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
          } else {
            var receiverIds = snapshot.data!;
            return ListView.builder(
              itemCount: receiverIds.length,  
              itemBuilder: (context, index) {
                var receiverId = receiverIds[index];
                return FutureBuilder(
                  future: getSellerDetailsById(receiverId),
                  builder: (context, sellerSnapshot) {
                    if (sellerSnapshot.connectionState == ConnectionState.waiting) {
                      return SkelotonChatLoader(screenSize: screenSize);                      
                    } else if (sellerSnapshot.hasError) {
                      return const ListTile(
                        title: Text('Error loading seller details'),
                      );
                    } else if (!sellerSnapshot.hasData) {
                      return const SizedBox.shrink();
                    } else {
                      var sellerData = sellerSnapshot.data!;
                      return UsersChatsHolder(
                        screenSize: screenSize, 
                        sellerData: sellerData, 
                        chatController: chatController, 
                        currentUserId: currentUserId, 
                        receiverId: receiverId,
                        userData: userData,
                      );
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