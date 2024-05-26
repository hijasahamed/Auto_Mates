import 'package:cloud_firestore/cloud_firestore.dart';


Future<List<Map<String, dynamic>>> getAllCars({required query}) async {
  print('get all car function working');
  print(query);
  CollectionReference firebaseObject = FirebaseFirestore.instance.collection('carstosell');
  QuerySnapshot querySnapshot = await firebaseObject.get();

  return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
}