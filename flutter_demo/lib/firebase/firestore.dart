import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_demo/firebase/index.dart';

class FirebaseFirestore {
  Future<void> setFirestoreProile(String userId, dynamic userData) async {
    return db
        .collection('users')
        .doc(userId)
        .set(userData, SetOptions(merge: true))
        .onError((error, stackTrace) => print(error));
  }
}
