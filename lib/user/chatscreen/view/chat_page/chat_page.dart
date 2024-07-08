import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/chatscreen/controller/chat_controller/chat_controller.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/commonwidgets/text_form_field/text_form_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ChatPage extends StatelessWidget {
  ChatPage({super.key,required this.sellerData,required this.screenSize});
  final dynamic sellerData;
  final Size screenSize;
  final TextEditingController messageController = TextEditingController();
  final ChatController chatControllerClass = ChatController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void sendMessage()async{
    dynamic userName = await fetchUserDetails();
    print(userName);
    if(messageController.text.isNotEmpty){      
      await chatControllerClass.sendMessage(receiverId: sellerData['sellerId'], message: messageController.text,senderName: userName.userName).then((value) => messageController.clear(),);     
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
          Expanded(
            child: buildMessagesection(),
          ),
          sendMessageSection()
        ],
      ),
    );
  }

  Widget buildMessagesection(){
    return StreamBuilder(
      stream: chatControllerClass.getMessages(receiverId: sellerData['sellerId'],userId: firebaseAuth.currentUser!.uid), 
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {        
        if(snapshot.hasError){
          return Text('Error ${snapshot.error}');
        }
        else if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
        }
        else{          
          return ListView(
          children: snapshot.data!.docs.map((document) {
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
                child: MyTextWidget(text: data['message'], color: Colors.white, size: screenSize.width/30, weight: FontWeight.bold),
              )
            ),
            MyTextWidget(text: formatTimestamp(data['timeStamp']), color: Colors.blueGrey, size: screenSize.width/45, weight: FontWeight.bold),
          ],
        ),
      ),
    );
  }

  String formatTimestamp(Timestamp timestamp) {
  var date = timestamp.toDate();
  return DateFormat('hh:mm a').format(date);
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
              sendMessage();
              }, 
              icon: Icon(Icons.send,color: Colors.white,size: screenSize.width/14,)
            ),
          )
        ],
      ),
    );
  }

}