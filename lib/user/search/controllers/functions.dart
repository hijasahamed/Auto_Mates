import 'package:cloud_firestore/cloud_firestore.dart';


// Future<List<Map<String, dynamic>>> getSearchingCars({required query}) async {
//   CollectionReference firebaseObject = FirebaseFirestore.instance.collection('carstosell');
//   QuerySnapshot querySnapshot = await firebaseObject.get();

//   return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
// }


Future<List<Map<String, dynamic>>>  getSearchingCars({required query})async{
  List<Map<String, dynamic>> result = [];
  try{
   CollectionReference firebaseObject = FirebaseFirestore.instance.collection('carstosell');
   QuerySnapshot querySnapshot = await firebaseObject.get();
    for(var doc in querySnapshot.docs){
      result.add({'id':doc.id,...doc.data() as Map<String,dynamic>});
    }
    return result;
  }catch (e){
    return [];
  }
}