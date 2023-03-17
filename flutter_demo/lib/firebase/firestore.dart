import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_demo/firebase/index.dart';

class FirebaseFirestoreService {
  Future<void> setFirestoreProile(String userId, dynamic userData) async {
    return db
        .collection('users')
        .doc(userId)
        .set(userData, SetOptions(merge: true))
        .onError((error, stackTrace) => {throw Exception(error)});
  }

  // user modalを型付けしたい
  Future<DocumentSnapshot<Map<String, dynamic>>> getFirestoreProfile(
      String userId) {
    return db.collection('users').doc(userId).get();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> listenFirestoreProfile(
      String userId) {
    return db.collection('users').doc(userId).snapshots();
  }
}
