import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  String? displayName;

  void setDisplayName(String? name) {
    displayName = name;
    notifyListeners();
  }
}
