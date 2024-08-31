import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/seller/seller_chat_screen/controller/seller_chat_controller.dart';
import 'package:auto_mates/seller/seller_chat_screen/view/seller_chatting_screen/seller_chatting_screen.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/chatscreen/controller/chat_controller/chat_controller.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SellerChatScreenChatsHolder extends StatelessWidget {
  const SellerChatScreenChatsHolder({super.key,required this.screenSize,required this.userdata,required this.currentSeller});
  final Size screenSize;
  final UserData userdata;
  final SellerData currentSeller;
  @override
  Widget build(BuildContext context) {
    bool hasNewMessage;
    int newMsgCount;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {           
            return SellerChattingScreen(userdata: userdata,screenSize: screenSize,currentSeller: currentSeller,);
          },
        ));
      },
      child: Ink(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: screenSize.height / 30,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: userdata.userProfile,
                    placeholder: (context, url) => CircleAvatar(
                      radius: screenSize.height / 30,
                      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
                      child: const CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: screenSize.width / 50,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MyTextWidget(
                    text: userdata.userName,
                    color: Colors.blueGrey,
                    size: screenSize.width / 25,
                    weight: FontWeight.bold
                  ),
                  StreamBuilder<List<QueryDocumentSnapshot>>(
                    stream: getAllMessagesInChattingScreen(receiverId: currentSeller.id, userId: userdata.id),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const SizedBox.shrink();
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const SizedBox.shrink();
                      } else {
                        List<DocumentSnapshot> sortedChats = snapshot.data!;
                        sortedChats.sort((a, b) {
                          Timestamp aTimestamp = a['timeStamp'];
                          Timestamp bTimestamp = b['timeStamp'];
                          return aTimestamp.compareTo(bTimestamp);
                        }); 
                        var lastMessage = sortedChats.last['message'];
                        var lastMessager = sortedChats.last['senderUid'];
                        var timestamp = sortedChats.last['timeStamp'];
                        var formattedTimestamp = timestamp as Timestamp;
                        
                        final String currentSellerUid = FirebaseAuth.instance.currentUser!.uid;
                        hasNewMessage = sellerCheckForNewMessage(sortedChats: sortedChats,currentId: currentSellerUid);
                        newMsgCount = sellerCountNewMessages(sortedChats,currentSellerUid);
              
                        return Row(
                          children: [
                            if(lastMessager == currentSellerUid)
                            Icon(Icons.check,size: screenSize.width/30,color: Colors.blueGrey,),
                            SizedBox(
                                width: screenSize.width / 1.8,
                                child: MyTextWidget(
                                    text: lastMessage,
                                    color: const Color.fromARGB(
                                        255, 126, 126, 126),
                                    size: screenSize.width / 30,
                                    weight: FontWeight.w500)),
                            MyTextWidget(
                                text: formatTimestamp(timestamp: formattedTimestamp,chatsScreen: false),
                                color:
                                    const Color.fromARGB(255, 126, 126, 126),
                                size: screenSize.width / 30,
                                weight: FontWeight.w500
                            ),
                            if(hasNewMessage==true && newMsgCount>0)
                            Padding(
                              padding: const EdgeInsets.only(right: 5,left: 5),
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.green,
                                child: Center(
                                  child: MyTextWidget(text: newMsgCount.toString(), color: Colors.white, size: screenSize.width/40, weight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  } 
}