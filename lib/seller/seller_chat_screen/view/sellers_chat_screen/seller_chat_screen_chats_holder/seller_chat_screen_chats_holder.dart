import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/seller/seller_chat_screen/controller/seller_chat_controller.dart';
import 'package:auto_mates/seller/seller_chat_screen/view/seller_chatting_screen/seller_chatting_screen.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/chatscreen/controller/chat_controller/chat_controller.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SellerChatScreenChatsHolder extends StatelessWidget {
  const SellerChatScreenChatsHolder({super.key,required this.screenSize,required this.userdata,required this.currentSeller});
  final Size screenSize;
  final UserData userdata;
  final SellerData currentSeller;
  @override
  Widget build(BuildContext context) {
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
                        var lastMessager = sortedChats.last['senderId'];
                        var timestamp = sortedChats.last['timeStamp'];
                        var formattedTimestamp = timestamp as Timestamp;
                        
              
                        return Row(
                          children: [                          
                            lastMessager == currentSeller.id? Icon(Icons.check,size: screenSize.width/30,color: Colors.blue,)
                            :Icon(Icons.person,size: screenSize.width/30,color: Colors.green,),
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