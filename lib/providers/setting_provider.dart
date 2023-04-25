import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool _isReadMode = false;

  bool get isDarkMode => _isDarkMode;
  bool get isReadMode => _isReadMode;

  set isDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  set isReadMode(bool value) {
    _isReadMode = value;
    notifyListeners();
  }
}
