import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/chatscreen/controller/chat_controller/chat_controller.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key,required this.sellerData,required this.screenSize});
  final dynamic sellerData;
  final Size screenSize;
  final TextEditingController messageController = TextEditingController();
  final ChatController chatController = ChatController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void sendMessage()async{
    if(messageController.text.isNotEmpty){
      await chatController.sendMessage(sellerData['sellerId'], messageController.text);
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50), 
        child: NormalAppBar(title: sellerData['sellerName'],isChatScreen: true,)
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(child: Text('Chat section'))
          ),
          messageSection()
        ],
      )
    );
  }

  Widget messageSection(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Expanded(
            child: TextField()
          ),
          IconButton(onPressed: () {
            
            }, icon: const Icon(Icons.send,color: Colors.green,)
          )
        ],
      ),
    );
  }

}