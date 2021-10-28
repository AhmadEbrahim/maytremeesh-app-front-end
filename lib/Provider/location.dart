import 'package:flutter/cupertino.dart';

class Location extends ChangeNotifier {
  String _location = 'Dokki';

  set location(String val) {
    _location = val;
    notifyListeners();
  }

  String get location => _location;
}
