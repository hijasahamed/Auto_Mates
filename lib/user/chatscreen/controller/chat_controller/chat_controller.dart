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

    await firestore.collection('chatRoom')
    .doc(chatRoomId)
    .collection('messages')
    .add(newMessage.toMap());
  }

  getMessages({receiverId ,userId} ){
      List<String> ids = [receiverId ,userId];
      ids.sort();
      String chatRoomId = ids.join("_");

      return firestore
        .collection('chatRoom')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timeStamp',descending: false)
        .snapshots();
  }
}

Stream<QuerySnapshot> getUsersChats({required String currentUserId}) {
  return FirebaseFirestore.instance
      .collection('chatRoom')
      .doc()
      .collection('messages')
      .where('senderId', isEqualTo: currentUserId)
      .snapshots();
}

// Stream<List<DocumentSnapshot>> getUsersChats({required String currentUserId}) async* {
//   CollectionReference chatRoomCollection = FirebaseFirestore.instance.collection('chatRoom');

//   await for (QuerySnapshot snapshot in chatRoomCollection.snapshots()) {
//     List<DocumentSnapshot> filteredDocuments = snapshot.docs.where((doc) {
//       String docId = doc.id;
//       print(docId);
//       List<String> splitIds = docId.split('_');
//       return splitIds.contains(currentUserId);
//     }).toList();

//     print(filteredDocuments);

//     yield filteredDocuments;
//   }
// }