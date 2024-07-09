import 'package:auto_mates/user/chatscreen/controller/chat_controller/chat_controller.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserChatScreen extends StatelessWidget {
  const UserChatScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    final ChatController chatControllerClass = ChatController();
    final String currentUserId = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<List<QueryDocumentSnapshot>>(
        stream: chatControllerClass.getUsersChats(currentUserId: currentUserId), 
          builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox.shrink();
          } else if (snapshot.hasError) {
            return Center(child: MyTextWidget(text: 'Something Went Wrong', color: Colors.black, size: screenSize.width/30, weight: FontWeight.bold),);
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return SizedBox(
              width: screenSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.message,color: Colors.blue,size: screenSize.width/5,),
                  MyTextWidget(text: 'No chat messages', color: Colors.black, size: screenSize.width/27, weight: FontWeight.w500),
                ],
              ),
            );
          }
          else{
            var chatRooms = snapshot.data!;
            return ListView.builder(
              itemCount: chatRooms.length,
              itemBuilder: (context, index) {
                var chatRoom = chatRooms[index];
                var chatRoomId = chatRoom.id;             
                return ListTile(
                  title: Text(chatRoomId),                  
                );
              },
            );
          }
        },
      ),
    );
  }
}
