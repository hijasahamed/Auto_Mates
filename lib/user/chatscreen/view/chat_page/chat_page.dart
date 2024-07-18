import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/seller/seller_chat_screen/controller/seller_chat_controller.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/chatscreen/controller/chat_controller/chat_controller.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/commonwidgets/text_form_field/text_form_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatelessWidget {
  ChatPage({super.key,required this.sellerData,required this.screenSize,required this.userData});
  final SellerData sellerData;
  final Size screenSize;
  final UserData userData;

  final TextEditingController messageController = TextEditingController();
  final ChatController chatControllerClass = ChatController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50), 
        child: NormalAppBar(title: sellerData.companyName,isChatScreen: true,)
      ),
      body: Column(
        children: [
          Expanded(
            child: buildMessagesection(),
          ),
          sendMessageSection()
        ],
      ),
    );
  }

  Widget buildMessagesection(){
    return StreamBuilder<List<QueryDocumentSnapshot>>(
      stream: getAllMessagesInChattingScreen(receiverId: userData.id, userId: sellerData.id), 
      builder: (context,snapshot) {        
        if(snapshot.hasError){
          return Text('Error ${snapshot.error}');
        }
        else if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
        }
        else{
          List<DocumentSnapshot> sortedDocs = snapshot.data!;
          sortedDocs.sort((a, b) {
            Timestamp aTimestamp = a['timeStamp'];
            Timestamp bTimestamp = b['timeStamp'];
            return aTimestamp.compareTo(bTimestamp);
          });  
          WidgetsBinding.instance.addPostFrameCallback((_) => scrollToEnd());         
          return ListView(
            controller: screenScrollController,
            children: sortedDocs.map((document) {
              return showMessageItems(document: document);
            }).toList(),
          );
        }
      },
    );
  }

Widget showMessageItems({document}){

    Map<String,dynamic> data = document.data() as Map<String,dynamic>;

    var alignment = (data['senderId'] == firebaseAuth.currentUser!.uid)
    ? Alignment.centerRight
    : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Container(
        alignment: alignment,
        width: screenSize.width/1.5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextWidget(text: data['senderName'], color: Colors.blueGrey, size: screenSize.width/45, weight: FontWeight.bold),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextWidget(text: data['message'], color: Colors.white, size: screenSize.width/30, weight: FontWeight.bold,maxline: true,),
                )
              ),
              MyTextWidget(text: formatTimestamp(data['timeStamp']), color: Colors.blueGrey, size: screenSize.width/45, weight: FontWeight.bold),
            ],
          ),
        ),
      ),
    );
  }

  Widget sendMessageSection(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: MyTextFormWidget(
              screenSize: screenSize,
              isChat: true,
              text: 'Overview',
              enabledBorderColor: Colors.transparent,
              valueTextColor: Colors.black,
              focusedBorderColor: Colors.transparent,
              labelTextColor: Colors.black,
              controller: messageController,
              warning: '',
              obscure: false,
              keyBoardType: TextInputType.name,
              textCapitalization:
              TextCapitalization.sentences,
              fillColor: const Color.fromARGB(255, 255, 255, 255)),
          ),
          SizedBox(width: screenSize.width/50,),
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.green,
            child: IconButton(
              onPressed: () {
              usersSendMessage(chatControllerClass: chatControllerClass,messageController: messageController,sellerData: sellerData,userData: userData);
              }, 
              icon: Icon(Icons.send,color: Colors.white,size: screenSize.width/14,)
            ),
          )
        ],
      ),
    );
  }

}