import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
   Future addUserDetail(Map<String, dynamic> userInfoMap, String id )async{
    await FirebaseFirestore.instance
    .collection("users")
    .doc(id)
    .set(userInfoMap);
    
   }

   Future addServiceProvider(Map<String, dynamic> userInfoMap, String id )async{
    await FirebaseFirestore.instance
    .collection("Service Provider")
    .doc(id)
    .set(userInfoMap);
    
   }
}