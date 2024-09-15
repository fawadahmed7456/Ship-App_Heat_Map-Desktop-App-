import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String _email = '';
  String _password = '';
  bool visibility = false;

  String get email => _email;
  String get password => _password;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setVisibility(bool value) {
    visibility = value;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  bool isEmailValid(String? value) {
    return value != null && value.isNotEmpty && value == "evission@gmail.com";
  }

  bool isPasswordValid(String? value) {
    return value != null && value.isNotEmpty && value == "evission123";
  }
}
