import 'dart:collection';

import 'package:auto_mates/seller/seller_chat_screen/controller/seller_chat_controller.dart';
import 'package:auto_mates/user/chatscreen/model/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatController extends ChangeNotifier{

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;


  Future<void> sendMessage({receiverId, message,senderName,userId,sellersMessage,})async{

    final String currentUserId = firebaseAuth.currentUser!.uid;
     final String currentUserEmail = firebaseAuth.currentUser!.email.toString();    
    final Timestamp timestamp = Timestamp.now();


    Message newMessage = Message(
      senderId: currentUserId,
      userId:userId, 
      senderEmail: currentUserEmail, 
      receiverId: receiverId, 
      message: message, 
      timeStamp: timestamp,
      senderName: senderName
    );

    await firestore.collection('chatRoom')
    .doc('chats')
    .collection('messages')
    .add(newMessage.toMap());

  }
  
}

Stream<List<String>> getTheCurrentUsersChatsWithSellers({required String currentUserId}) {
  return FirebaseFirestore.instance
      .collection('chatRoom')
      .doc('chats')
      .collection('messages')
      .where('senderId', isEqualTo: currentUserId)
      .snapshots()
      .map((querySnapshot) {
        List<QueryDocumentSnapshot> sortedDocs = querySnapshot.docs;
        sortedDocs.sort((b, a) {
          Timestamp aTimestamp = a['timeStamp'];
          Timestamp bTimestamp = b['timeStamp'];
          return aTimestamp.compareTo(bTimestamp);
        });

        LinkedHashSet<String> uniqueReceiverIds = LinkedHashSet();
        for (var doc in sortedDocs) {
          uniqueReceiverIds.add(doc['receiverId'] as String);
        }

        return uniqueReceiverIds.toList();
      });
}


String formatTimestamp(Timestamp timestamp) {
  DateTime date = timestamp.toDate();
  DateTime now = DateTime.now();

  if (date.year == now.year && date.month == now.month && date.day == now.day) {
    return DateFormat('hh:mm a').format(date);
  } else if (date.year == now.year && date.month == now.month && date.day == now.day - 1) {
    return 'Yesterday';
  } else {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}

void usersSendMessage({messageController,chatControllerClass,sellerData,userData,})async{
  String chat = messageController.text;
  messageController.clear();
  if(chat != ''){      
    await chatControllerClass.sendMessage(receiverId: sellerData.id, message: chat,senderName: userData.userName,userId: userData.id,).then((value) => chat = '',); 
    scrollToEnd();    
  }
}