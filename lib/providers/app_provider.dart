import 'package:flutter/foundation.dart';

class AppProvider extends ChangeNotifier {
  String _selectedLanguage = 'All';
  bool _isAdultVerified = false;

  String get selectedLanguage => _selectedLanguage;
  bool get isAdultVerified => _isAdultVerified;

  void setLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }

  void verifyAdult() {
    _isAdultVerified = true;
    notifyListeners();
  }

  void resetAdultVerification() {
    _isAdultVerified = false;
    notifyListeners();
  }
}
