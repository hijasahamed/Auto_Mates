import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/chatscreen/controller/chat_controller/chat_controller.dart';
import 'package:auto_mates/user/chatscreen/view/chat_page/chat_page.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/commonwidgets/shimmer_effect/shimmer_effect.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserChatScreen extends StatelessWidget {
  const UserChatScreen({super.key, required this.screenSize});
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    final String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    final ChatController chatController = ChatController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<String>>(
        future: getUsersChats(currentUserId: currentUserId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SkelotonIndicatorListForChats(screenSize: screenSize, itemCount: 11);
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
            return SizedBox(
              width: screenSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.message, color: Colors.blue, size: screenSize.width / 5),
                  MyTextWidget(
                    text: 'No chat messages',
                    color: Colors.black,
                    size: screenSize.width / 27,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            );
          } else {
            var receiverIds = snapshot.data!;
            return ListView.builder(
              itemCount: receiverIds.length,
              itemBuilder: (context, index) {
                var receiverId = receiverIds[index];
                return FutureBuilder(
                  // future: getChattedSellerDetails(receiverId),
                  future: getSellerDetailsById(receiverId),
                  builder: (context, sellerSnapshot) {
                    if (sellerSnapshot.connectionState == ConnectionState.waiting) {
                      return Container(color: Colors.yellow,);
                    } else if (sellerSnapshot.hasError) {
                      return const ListTile(
                        title: Text('Error loading seller details'),
                      );
                    } else if (!sellerSnapshot.hasData) {
                      return const ListTile(
                        title: Text('Seller not found'),
                      );
                    } else {
                      var sellerData = sellerSnapshot.data!;
                      return InkWell(
                        onTap: () {                                                    
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return ChatPage(sellerData: sellerData, screenSize: screenSize);
                          },));
                        },
                        child: Ink(
                          decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10,left: 10,bottom: 10),
                            child: Row(
                              children: [
                                ClipOval(
                                  child: Container(
                                    height: screenSize.height/13,
                                    width: screenSize.height/13,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: NetworkImage(sellerData.sellerProfile),fit: BoxFit.cover)
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenSize.width/50,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyTextWidget(text: sellerData.companyName, color: Colors.blueGrey, size: screenSize.width/25, weight: FontWeight.bold),
                                    StreamBuilder<QuerySnapshot>(
                                      stream: chatController.getMessages(userId: currentUserId,receiverId: receiverId), 
                                      builder: (context, snapshot) {
                                         if(snapshot.hasError){
                                            return const SizedBox.shrink();
                                          }
                                          else if(snapshot.connectionState == ConnectionState.waiting){
                                            return const SizedBox.shrink();
                                          }
                                          else{
                                            var messages = snapshot.data!.docs;
                                            var lastMessage = messages.last['message'];
                                            var timestamp = messages.last['timeStamp'];
                                            var formattedTimestamp = timestamp as Timestamp;
                                            return SizedBox(
                                              width: screenSize.width/1.3,
                                              child: Row(
                                                children: [
                                                 SizedBox(
                                                  width: screenSize.width/1.8,
                                                  child: MyTextWidget(text: lastMessage, color: const Color.fromARGB(255, 126, 126, 126), size: screenSize.width/30, weight: FontWeight.w500)),
                                                 const Spacer(),                         
                                                 MyTextWidget(text: formatTimestamp(formattedTimestamp), color: const Color.fromARGB(255, 126, 126, 126), size: screenSize.width/30, weight: FontWeight.w500)
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