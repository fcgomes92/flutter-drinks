import 'package:flutter/widgets.dart';

class User with ChangeNotifier {
  String key;
  String email;
  String token;
  bool isAuthenticated;

  void login({String, key, String email, String token}) {
    this.key = key;
    this.email = email;
    this.token = token;
    this.isAuthenticated = true;
    notifyListeners();
  }

  void logout() {
    this.key = null;
    this.email = null;
    this.token = null;
    this.isAuthenticated = false;
    notifyListeners();
  }
}
