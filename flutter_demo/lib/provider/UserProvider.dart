import 'package:flutter/material.dart';
import 'package:flutter_demo/molde/user.dart';

class UserProvider with ChangeNotifier {
  late String id;

  void setUserId(String _id) {
    id = _id;
  }

  String getUserId() {
    return id;
  }
}
