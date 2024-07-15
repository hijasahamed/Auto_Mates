import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

Stream<List<String>> getSellersChatsWithUsersStream({required String currentSellerId}) {
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
          uniqueReceiverIds.add(doc['senderId'] as String);
        }

        return uniqueReceiverIds.toList();
      });
}