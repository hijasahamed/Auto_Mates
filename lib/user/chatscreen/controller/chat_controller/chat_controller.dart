// ignore_for_file: use_build_context_synchronously

import 'dart:collection';
import 'dart:developer';
import 'package:auto_mates/seller/seller_chat_screen/controller/seller_chat_controller.dart';
import 'package:auto_mates/user/chatscreen/model/model.dart';
import 'package:auto_mates/user/chatscreen/view/bloc/user_chat_bloc.dart';
import 'package:auto_mates/user/chatscreen/view/rate_sellers/rate_sellers.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatController extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(
      {receiverId, message, senderName, senderId, sellersMessage}) async {
        final sharedPref = await SharedPreferences.getInstance();
    final isLogedin = sharedPref.getBool(logedInKey);
    final String currentUserUid = (isLogedin == true)?firebaseAuth.currentUser!.uid:'noData';
    final String currentUserEmail = (isLogedin == true)?firebaseAuth.currentUser!.email.toString():'noData';
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
        senderUid: currentUserUid,
        senderId: senderId,
        senderEmail: currentUserEmail,
        receiverId: receiverId,
        message: message,
        timeStamp: timestamp,
        senderName: senderName);

    await firestore
        .collection('chatRoom')
        .doc('chats')
        .collection('messages')
        .add(newMessage.toMap());
  }
}

Stream<List<String>> getTheCurrentUsersChatsWithSellers(
    {required String currentUserId}) {
  return FirebaseFirestore.instance
      .collection('chatRoom')
      .doc('chats')
      .collection('messages')
      .where('senderUid', isEqualTo: currentUserId)
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

String formatTimestamp({timestamp,chatsScreen}) {
  DateTime date = timestamp.toDate();
  DateTime now = DateTime.now();

  if (date.year == now.year && date.month == now.month && date.day == now.day) {
    return DateFormat('hh:mm a').format(date);
  } else if (chatsScreen == true) {
    return DateFormat('hh:mm a').format(date);
  } else if (date.year == now.year &&
      date.month == now.month &&
      date.day == now.day - 1) {
    return 'Yesterday';
  } else {
    return DateFormat('dd MMM yyyy').format(date);
  }
}

//users send message
void usersSendMessage(
    {messageController,
    chatControllerClass,
    sellerData,
    userData,
    sendedMessageCount}) async {
  String chat = messageController.text;
  messageController.clear();
  if (chat != '') {
    await chatControllerClass
        .sendMessage(
            receiverId: sellerData.id,
            message: chat,
            senderName: userData.userName,
            senderId: userData.id)
        .then(
          (value) => chat = '',
        );
    scrollToEnd();
  }
}

//Rate the seller

void showRatingPopup({context, screenSize, sellerData,userData}) { 
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return RateSellers(screenSize: screenSize, sellerData: sellerData,userData: userData,);
    },
  );
}

final UserChatBloc userChatBloc = UserChatBloc();
dynamic ratingValue=0;
String emoji = '😞';

String getEmojiForRating(double rating) {
  if (rating == 5) {
    return '😃';
  } else if (rating == 4) {
    return '😊';
  } else if (rating == 3) {
    return '😐';
  } else if (rating == 2) {
    return '🙁';
  } else {
    return '😞';
  }
}


void addRating({required sellerData, required double rating, required BuildContext context,required UserChatBloc userRates,required userData}) async{
  userRates.add(UserRatedTheSellerLoadingEvent());
  int intRating = rating.toInt();
  final CollectionReference collection = FirebaseFirestore.instance.collection('sellerSignupData');
  collection.doc(sellerData.id).get().then((doc) {
    if (doc.exists) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      List<int> currentRatings = data != null && data.containsKey('rating') 
        ? List<int>.from(data['rating']) 
        : [];
      List<String> ratedSellers = data != null && data.containsKey('ratedSellers')
        ? List<String>.from(data['ratedSellers'])
        : [];

      currentRatings.add(intRating);

      if (!ratedSellers.contains(userData.id)) {
        ratedSellers.add(userData.id);
      }

      collection.doc(sellerData.id).set({
        'rating': currentRatings,
        'ratedSellers': ratedSellers
      }, SetOptions(merge: true)).then((_)async {
        userRates.add(UserRatedTheSellerEvent());
        await Future.delayed(const Duration(milliseconds: 1500));
        Navigator.of(context).pop();
        
      }).catchError((error) {
        log(error.toString());
      });
    }
  }).catchError((error) {
    log(error.toString());
  });
}

Future<bool> isUserRatedSeller({ 
  required String sellerId,
  required String userId,
}) async {
  final DocumentSnapshot sellerSnapshot = await FirebaseFirestore.instance
      .collection('sellerSignupData')
      .doc(sellerId)
      .get();

  if (sellerSnapshot.exists && sellerSnapshot.data() != null) {
    List<dynamic> ratedSellers = sellerSnapshot['ratedSellers'] ?? [];
    return ratedSellers.contains(userId);
  } else {
    return false;
  }
}

// delete chat 
deleteUserChat({sellerData,userData,data}){
  FirebaseFirestore.instance
  .collection('chatRoom')
  .doc('chats')
  .collection('messages')
  .where('receiverId', isEqualTo: sellerData.id)
  .where('senderId', isEqualTo: userData.id)
  .where('message', isEqualTo: data['message'])
  .where('timeStamp', isEqualTo: data['timeStamp'])
  .get()
  .then((querySnapshot) {
    for (var doc in querySnapshot.docs) {
      doc.reference.delete();
    }
  });
}

bool userCheckForNewMessage({sortedChats,currentId}) {
  final DateTime now = DateTime.now();

  for (var chat in sortedChats) {
    final DateTime messageTime = (chat['timeStamp'] as Timestamp).toDate();
    final String senderId = chat['senderUid'];

    if (senderId != currentId && now.difference(messageTime).inMinutes < 1) {
      return true;
    }
  }
  return false;
}

int userCountNewMessages(List<DocumentSnapshot> sortedChats,currentId) {
  final DateTime now = DateTime.now();
  int newMessageCount = 0;

  for (var chat in sortedChats) {
    final DateTime messageTime = (chat['timeStamp'] as Timestamp).toDate();
    final String senderId = chat['senderUid'];
    if (now.difference(messageTime).inMinutes < 1 && senderId != currentId) {
      newMessageCount++;
    }
  }
  return newMessageCount; 
}