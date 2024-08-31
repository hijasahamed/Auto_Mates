import 'package:auto_mates/seller/seller_chat_screen/controller/seller_chat_controller.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/chatscreen/controller/chat_controller/chat_controller.dart';
import 'package:auto_mates/user/chatscreen/view/chat_page/chat_page.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UsersChatsHolder extends StatelessWidget {
  const UsersChatsHolder(
      {super.key,
      required this.screenSize,
      required this.sellerData,
      required this.chatController,
      required this.currentUserId,
      required this.userData,
      required this.receiverId});
  final Size screenSize;
  final dynamic sellerData;
  final ChatController chatController;
  final String currentUserId;
  final String receiverId;
  final UserData userData;
  @override
  Widget build(BuildContext context) {
    bool hasNewMessage;
    int newMsgCount;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return ChatPage(sellerData: sellerData, screenSize: screenSize,userData: userData,);
          },
        ));
      },
      child: Ink(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: screenSize.height / 30,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: sellerData.sellerProfile,
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
              SizedBox(
                width: screenSize.width / 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextWidget(
                      text: sellerData.companyName,
                      color: Colors.blueGrey,
                      size: screenSize.width / 25,
                      weight: FontWeight.bold),
                  StreamBuilder<List<QueryDocumentSnapshot>>(
                    stream: getAllMessagesInChattingScreen(receiverId: userData.id, userId: sellerData.id), 
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const SizedBox.shrink();
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const SizedBox.shrink();
                      } else {
                        List<DocumentSnapshot> sortedDocs = snapshot.data!;
                        sortedDocs.sort((a, b) {
                          Timestamp aTimestamp = a['timeStamp'];
                          Timestamp bTimestamp = b['timeStamp'];
                          return aTimestamp.compareTo(bTimestamp);
                        }); 
                        var lastMessage = sortedDocs.last['message'];
                        var lastMessager = sortedDocs.last['senderUid'];
                        var lastMessageTimestamp = sortedDocs.last['timeStamp'];
                        final String currentUserUid = FirebaseAuth.instance.currentUser!.uid;

                        hasNewMessage = userCheckForNewMessage(sortedChats: sortedDocs,currentId: currentUserId);
                        newMsgCount = userCountNewMessages(sortedDocs,currentUserUid);

                        return SizedBox(
                          width: screenSize.width / 1.3,
                          child: Row(
                            children: [
                              lastMessager == currentUserUid
                              ? Icon(Icons.check,size: screenSize.width/30,color: Colors.blueGrey,)
                              : Icon(Icons.person, size: screenSize.width / 30, color: Colors.green),
                              Expanded(
                                child: SizedBox(                                    
                                    child: MyTextWidget(
                                        text: lastMessage,
                                        color: const Color.fromARGB(
                                            255, 126, 126, 126),
                                        size: screenSize.width / 30,
                                        weight: FontWeight.w500)),
                              ),
                              MyTextWidget(
                                  text: formatTimestamp(timestamp: lastMessageTimestamp,chatsScreen: false),
                                  color:
                                      const Color.fromARGB(255, 126, 126, 126),
                                  size: screenSize.width / 35,
                                  weight: FontWeight.w500),
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
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}