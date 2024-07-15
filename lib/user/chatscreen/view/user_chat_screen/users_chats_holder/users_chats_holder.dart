import 'package:auto_mates/user/chatscreen/controller/chat_controller/chat_controller.dart';
import 'package:auto_mates/user/chatscreen/view/chat_page/chat_page.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UsersChatsHolder extends StatelessWidget {
  const UsersChatsHolder(
      {super.key,
      required this.screenSize,
      required this.sellerData,
      required this.chatController,
      required this.currentUserId,
      required this.receiverId});
  final Size screenSize;
  final dynamic sellerData;
  final ChatController chatController;
  final String currentUserId;
  final String receiverId;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return ChatPage(sellerData: sellerData, screenSize: screenSize);
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
                  height: screenSize.height / 13,
                  width: screenSize.height / 13,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(sellerData.sellerProfile),
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
                      text: sellerData.companyName,
                      color: Colors.blueGrey,
                      size: screenSize.width / 25,
                      weight: FontWeight.bold),
                  StreamBuilder<QuerySnapshot>(
                    stream: chatController.getMessages(
                        userId: currentUserId, receiverId: receiverId),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const SizedBox.shrink();
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const SizedBox.shrink();
                      } else {
                        List<DocumentSnapshot> sortedDocs = snapshot.data!.docs;
                        sortedDocs.sort((a, b) {
                          Timestamp aTimestamp = a['timeStamp'];
                          Timestamp bTimestamp = b['timeStamp'];
                          return aTimestamp.compareTo(bTimestamp);
                        }); 
                        var lastMessage = sortedDocs.last['message'];
                        var timestamp = sortedDocs.last['timeStamp'];
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
