import 'package:cloud_firestore/cloud_firestore.dart';


Future<List<Map<String, dynamic>>> getSearchingCars({required query}) async {
  CollectionReference firebaseObject = FirebaseFirestore.instance.collection('carstosell');
  QuerySnapshot querySnapshot = await firebaseObject.get();

  return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
}