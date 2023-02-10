import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_demo/firebase/index.dart';

class FirebaseAuthService {
  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    return await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    return await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
