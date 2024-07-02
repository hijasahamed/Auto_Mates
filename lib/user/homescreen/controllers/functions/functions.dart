
import 'package:cloud_firestore/cloud_firestore.dart';

Stream<QuerySnapshot> getfavouriteCars({String? userContact}){
  return FirebaseFirestore.instance
  .collection('userFavouriteCars')
  .where('userContact',isEqualTo: userContact)
  .snapshots();
}