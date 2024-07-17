import 'dart:collection';

import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

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
      uniqueReceiverIds.add(doc['userId'] as String);
    }

    return uniqueReceiverIds.toList();
  });
}

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

// Stream<QuerySnapshot> getAllMessages({required String receiverId, required String userId,}) {
//     Query query = FirebaseFirestore.instance
//         .collection('chatRoom')
//         .doc('chats')
//         .collection('messages')
//         .where('receiverId', isEqualTo: receiverId)
//         .where('userId',isEqualTo: userId)
//         .where('receiverId', isEqualTo: userId)
//         .where('userId',isEqualTo: receiverId);    
//      return query.snapshots();
// }


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