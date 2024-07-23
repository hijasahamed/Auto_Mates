
import 'package:cloud_firestore/cloud_firestore.dart';

Stream<QuerySnapshot> getfavouriteCars({String? userContact}){
  return FirebaseFirestore.instance
  .collection('userFavouriteCars')
  .where('userContact',isEqualTo: userContact)
  .snapshots();
}

Stream<List<Map<String, dynamic>>> findTopRatedSellers() async* {
  final CollectionReference collection = FirebaseFirestore.instance.collection('sellerSignupData');

  yield* collection.snapshots().map((snapshot) {
    List<Map<String, dynamic>> sellers = [];

    for (var doc in snapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      List<dynamic> ratings = data['rating'] ?? [];

      double sum = ratings.fold(0.0, (previousValue, element) => previousValue + (element is num ? element.toDouble() : 0.0));

      sellers.add({
        'id': doc.id,
        'data': data,
        'sumRating': sum,
      });
    }

    sellers.sort((a, b) => b['sumRating'].compareTo(a['sumRating']));

    return sellers;
  });
}