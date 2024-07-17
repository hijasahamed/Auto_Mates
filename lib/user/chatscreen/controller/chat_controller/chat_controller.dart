import 'dart:collection';

import 'package:auto_mates/user/chatscreen/model/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatController extends ChangeNotifier{

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;


  Future<void> sendMessage({receiverId, message,senderName,userId})async{

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

  Stream<QuerySnapshot> getMessages({required String receiverId, required String userId, required bool isSeller}) {
    Query query = FirebaseFirestore.instance
        .collection('chatRoom')
        .doc('chats')
        .collection('messages')
        .where('receiverId', isEqualTo: receiverId);

    if (isSeller) {
      query = query.where('userId', isEqualTo: userId);
    } else {
      query = query.where('senderId', isEqualTo: userId);
    }

    return query.snapshots();
  }

  
}

Stream<List<String>> getChatsListOfUsersWithSellers({required String currentUserId}) {
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