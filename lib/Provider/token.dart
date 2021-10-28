import 'package:flutter/cupertino.dart';

class Token extends ChangeNotifier {
  String _token = '';

  set token(String val) {
    _token = val;
    notifyListeners();
  }

  String get token => _token;
}
