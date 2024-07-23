import 'dart:collection';
import 'dart:developer';

import 'package:auto_mates/seller/seller_chat_screen/controller/seller_chat_controller.dart';
import 'package:auto_mates/user/chatscreen/model/model.dart';
import 'package:auto_mates/user/chatscreen/view/bloc/user_chat_bloc.dart';
import 'package:auto_mates/user/chatscreen/view/rate_sellers/rate_sellers.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatController extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(
      {receiverId, message, senderName, senderId, sellersMessage}) async {
    final String currentUserUid = firebaseAuth.currentUser!.uid;
    final String currentUserEmail = firebaseAuth.currentUser!.email.toString();
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

String formatTimestamp(Timestamp timestamp) {
  DateTime date = timestamp.toDate();
  DateTime now = DateTime.now();

  if (date.year == now.year && date.month == now.month && date.day == now.day) {
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

void showRatingPopup({context, screenSize, sellerData}) { 
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return RateSellers(screenSize: screenSize, sellerData: sellerData);
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


void addRating({required sellerData, required double rating, required BuildContext context}) {
  int intRating = rating.toInt();
  final CollectionReference collection = FirebaseFirestore.instance.collection('sellerSignupData');

  collection.doc(sellerData.id).get().then((doc) {
    if (doc.exists) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      List<int> currentRatings = data != null && data.containsKey('rating') 
        ? List<int>.from(data['rating']) 
        : [];

      currentRatings.add(intRating);

      collection.doc(sellerData.id).set({
        'rating': currentRatings
      }, SetOptions(merge: true)).then((_) {
        Navigator.of(context).pop();
        snackbarWidget('Your rating is marked', context, Colors.green, Colors.white, SnackBarBehavior.fixed);
      }).catchError((error) {
        log(error.toString());
      });
    }
  }).catchError((error) {
    log(error.toString());
  });
}