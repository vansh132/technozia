import 'package:flutter/material.dart';
import 'package:technozia/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: "",
    fullName: "",
    college: "",
    phoneNo: 0,
    email: "",
    password: "",
    type: "",
    token: "",
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
