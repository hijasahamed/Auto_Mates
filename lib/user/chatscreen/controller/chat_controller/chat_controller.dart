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


    // List<String> ids = [currentUserId,receiverId];
    // ids.sort();
    // String chatRoomId = ids.join("_");

    // await firestore.collection('chatRoom')
    // .doc(chatRoomId)
    // .collection('messages')
    // .add(newMessage.toMap());

    await firestore.collection('chatRoom')
    .doc(currentUserId)
    .collection('messages')
    .add(newMessage.toMap());

  }

  getMessages({receiverId ,userId} ){     
      return firestore
            .collection('chatRoom')
            .doc(userId)
            .collection('messages')
            .where('senderId',isEqualTo: userId)
            .where('receiverId',isEqualTo: receiverId)           
            .snapshots();
  }
}

Future<List<String>> getUsersChats({required String currentUserId}) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('chatRoom')
      .doc(currentUserId)
      .collection('messages')
      .where('senderId', isEqualTo: currentUserId)
      .get();

  Set<String> uniqueReceiverIds = querySnapshot.docs
      .map((doc) => doc['receiverId'] as String)
      .toSet();

  return uniqueReceiverIds.toList();
}

Future<Map<String, dynamic>> getChattedSellerDetails(String sellerId) async {
  DocumentSnapshot sellerSnapshot = await FirebaseFirestore.instance
      .collection('sellerSignupData')
      .doc(sellerId)
      .get();

  return sellerSnapshot.data() as Map<String, dynamic>;
}

String formatTimestamp(Timestamp timestamp) {
  var date = timestamp.toDate();
  return DateFormat('hh:mm a').format(date);
}