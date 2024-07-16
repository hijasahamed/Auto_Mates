import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/chatscreen/controller/chat_controller/chat_controller.dart';
import 'package:auto_mates/user/chatscreen/view/chat_page/chat_page.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SellerChatScreenChatsHolder extends StatelessWidget {
  const SellerChatScreenChatsHolder({super.key,required this.screenSize,required this.userdata,required this.currentSellerId});
  final Size screenSize;
  final UserData userdata;
  final SellerData currentSellerId;
  @override
  Widget build(BuildContext context) {
    ChatController chatController = ChatController();
    return InkWell(
      onTap: () {
       Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return ChatPage(screenSize: screenSize,isFromSeller: true,);
          },
        ));
      },
      child: Ink(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
          child: Row(
            children: [
              ClipOval(
                child: Container(
                  height: screenSize.height / 14,
                  width: screenSize.height / 14,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(userdata.userProfile),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                width: screenSize.width / 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextWidget(
                    text: userdata.userName,
                    color: Colors.blueGrey,
                    size: screenSize.width / 25,
                    weight: FontWeight.bold
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: chatController.getMessages(receiverId: currentSellerId.id,userId: userdata.id,isSeller: true),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const SizedBox.shrink();
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const SizedBox.shrink();
                      } else {
                        List<DocumentSnapshot> sortedChats = snapshot.data!.docs;
                        sortedChats.sort((a, b) {
                          Timestamp aTimestamp = a['timeStamp'];
                          Timestamp bTimestamp = b['timeStamp'];
                          return aTimestamp.compareTo(bTimestamp);
                        }); 
                        var lastMessage = sortedChats.last['message'];
                        var timestamp = sortedChats.last['timeStamp'];
                        var formattedTimestamp = timestamp as Timestamp;
                        return SizedBox(
                          width: screenSize.width / 1.3,
                          child: Row(
                            children: [
                              SizedBox(
                                  width: screenSize.width / 1.8,
                                  child: MyTextWidget(
                                      text: lastMessage,
                                      color: const Color.fromARGB(
                                          255, 126, 126, 126),
                                      size: screenSize.width / 30,
                                      weight: FontWeight.w500)),
                              const Spacer(),
                              MyTextWidget(
                                  text: formatTimestamp(formattedTimestamp),
                                  color:
                                      const Color.fromARGB(255, 126, 126, 126),
                                  size: screenSize.width / 30,
                                  weight: FontWeight.w500)
                            ],
                          ),
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