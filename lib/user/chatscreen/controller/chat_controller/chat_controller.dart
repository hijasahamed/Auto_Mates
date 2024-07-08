import 'package:auto_mates/user/chatscreen/model/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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


    List<String> ids = [currentUserId,receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    await firestore.collection('chat_room')
    .doc(chatRoomId)
    .collection('messages')
    .add(newMessage.toMap());
  }

  getMessages({receiverId ,userId} ){
      List<String> ids = [receiverId ,userId];
      ids.sort();
      String chatRoomId = ids.join("_");

      return firestore
        .collection('chat_room')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timeStamp',descending: false)
        .snapshots();

  }

}