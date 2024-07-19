import 'dart:collection';

import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

Stream<List<String>> getTheCurrentSellersChatsWithUsers({required String currentSellerId}) {
  return FirebaseFirestore.instance
      .collection('chatRoom')
      .doc('chats')
      .collection('messages')
      .where('receiverId', isEqualTo: currentSellerId)
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
      uniqueReceiverIds.add(doc['userId'] as String);
    }

    return uniqueReceiverIds.toList();
  });
}

// Stream<List<QueryDocumentSnapshot>> hijasSample({currentSellerId,}) {
//   Query query1 = FirebaseFirestore.instance
//       .collection('chatRoom')
//       .doc('chats')
//       .collection('messages')
//       .where('receiverId', isEqualTo: currentSellerId);

//   Query query2 = FirebaseFirestore.instance
//       .collection('chatRoom')
//       .doc('chats')
//       .collection('messages')
//       .where('senderEmail', isEqualTo: "" );

//   Stream<QuerySnapshot> stream1 = query1.snapshots();
//   Stream<QuerySnapshot> stream2 = query2.snapshots();

//   return Rx.combineLatest2(stream1, stream2, (QuerySnapshot snapshot1, QuerySnapshot snapshot2) {
//     List<QueryDocumentSnapshot> combinedList = [];
//     combinedList.addAll(snapshot1.docs);
//     combinedList.addAll(snapshot2.docs);
//     return combinedList;
//   });
// }

Future<UserData?> getUserDetailsById(String userId) async {
  final CollectionReference sellerSignupFirebaseObject =
      FirebaseFirestore.instance.collection('userSignupData');
  try {
    QuerySnapshot querySnapshot = await sellerSignupFirebaseObject.get();
    for (var doc in querySnapshot.docs) {
      if (doc.id == userId) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        UserData sellerDetails = UserData(
          userProfile: data['userProfile'],
          userName: data['userName'],
          email: data['email'],
          location: data['location'],
          mobile: data['mobile'],
          id: doc.id
        );
        return sellerDetails;
      }
    }
  } catch (e) {
    return null;
  }
  return null;
}


Stream<List<QueryDocumentSnapshot>> getAllMessagesInChattingScreen({required String receiverId, required String userId}) {
  Query query1 = FirebaseFirestore.instance
      .collection('chatRoom')
      .doc('chats')
      .collection('messages')
      .where('receiverId', isEqualTo: receiverId)
      .where('userId', isEqualTo: userId);

  Query query2 = FirebaseFirestore.instance
      .collection('chatRoom')
      .doc('chats')
      .collection('messages')
      .where('receiverId', isEqualTo: userId)
      .where('userId', isEqualTo: receiverId);

  Stream<QuerySnapshot> stream1 = query1.snapshots();
  Stream<QuerySnapshot> stream2 = query2.snapshots();

  return Rx.combineLatest2(stream1, stream2, (QuerySnapshot snapshot1, QuerySnapshot snapshot2) {
    List<QueryDocumentSnapshot> combinedList = [];
    combinedList.addAll(snapshot1.docs);
    combinedList.addAll(snapshot2.docs);
    return combinedList;
  });
}


//chatting page 

final ScrollController screenScrollController = ScrollController();

void scrollToEnd() { 
  if (screenScrollController.hasClients) {
    screenScrollController.jumpTo(screenScrollController.position.maxScrollExtent);
  }
}

void sellersSendMessage({sellersMessageController,chatControllerClass,userdata,currentSeller,})async{
  String chat = sellersMessageController.text;
  sellersMessageController.clear();
  if(chat != ''){      
    await chatControllerClass.sendMessage(receiverId: userdata.id, message: chat,senderName: currentSeller.companyName,userId: currentSeller.id,).then((value) => chat = '',);
    scrollToEnd();     
  }
}


bool checkForNewMessage({sortedChats,currentId}) {
  final DateTime now = DateTime.now();

  for (var chat in sortedChats) {
    final DateTime messageTime = (chat['timeStamp'] as Timestamp).toDate();
    final String senderId = chat['senderId'];

    if (senderId != currentId && now.difference(messageTime).inMinutes < 1) {
      return true;
    }
  }

  return false;
}

int countNewMessages(List<DocumentSnapshot> sortedChats) {
  final DateTime now = DateTime.now();
  int newMessageCount = 0;

  for (var chat in sortedChats) {
    final DateTime messageTime = (chat['timeStamp'] as Timestamp).toDate();
    if (now.difference(messageTime).inMinutes < 1) {
      newMessageCount++;
    }
  }

  return newMessageCount;
}