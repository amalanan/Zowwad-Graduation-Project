import 'package:flutter/material.dart';

class AdDetailsMore2Provider extends ChangeNotifier {
  bool showArabic = false;

  void showArabicTab() {
    showArabic = true;
    notifyListeners();
  }

  void showEnglishTab() {
    showArabic = false;
    notifyListeners();
  }
}
