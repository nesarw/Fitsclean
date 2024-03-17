import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetails(Map<String,dynamic> userInfoMap , String id)async{
    return await FirebaseFirestore.instance.collection("User").doc(id).set(userInfoMap);
  }

  Future updateUserDetails(Map<String,dynamic> updateInfo , String uid)async{
    return await FirebaseFirestore.instance.collection("User").doc(uid).update(updateInfo);
  }
}
