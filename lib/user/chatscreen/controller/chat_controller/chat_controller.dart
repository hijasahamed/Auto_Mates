import 'dart:collection';

import 'package:auto_mates/user/chatscreen/model/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatController extends ChangeNotifier{

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Send meddage
  Future<void> sendMessage({receiverId, message,senderName})async{

    final String currentUserId = firebaseAuth.currentUser!.uid;
    final String currentUserEmail = firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();


    Message newMessage = Message(
      senderId: currentUserId, 
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

  getMessages({receiverId ,userId} ){     
    return firestore
      .collection('chatRoom')
      .doc('chats')
      .collection('messages')
      .where('senderId',isEqualTo: userId)
      .where('receiverId',isEqualTo: receiverId)          
      .snapshots();
  }
}

Stream<List<String>> getUsersChatsWithSellersStream({required String currentUserId}) {
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
  var date = timestamp.toDate();
  return DateFormat('hh:mm a').format(date);
}