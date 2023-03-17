import 'package:flutter/material.dart';
import 'package:flutter_demo/molde/user.dart';

class UserProvider with ChangeNotifier {
  late String id = '';
  late String name = '';
  late String phoneNumber = '';
  late String email = '';
  late User user = User(id, name, phoneNumber, email);
  void setUser(String id, String name, String phoneNumber, String email) {
    user = User(id, name, phoneNumber, email);
  }

  User getUser() {
    return user;
  }

  void setUserId(String _id) {
    id = _id;
    notifyListeners();
  }

  String getUserId() {
    return id;
  }
}
