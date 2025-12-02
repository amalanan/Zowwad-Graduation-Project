import 'package:flutter/material.dart';

class ChangePassProvider extends ChangeNotifier {
  bool _isArabic = false;
  bool _isEnglish = false;
  bool _isSpanish = false;
  bool _isBengali = false;

  bool get isArabic => _isArabic;

  bool get isEnglish => _isEnglish;

  bool get isSpanish => _isSpanish;

  bool get isBengali => _isBengali;
  void toggleArabic() {
    _isArabic = !_isArabic;
    _isSpanish = false;
    _isEnglish = false;
    _isBengali = false;
    notifyListeners();
  }

  void toggleSpanish() {
    _isSpanish = !_isSpanish;
    _isEnglish = false;
    _isBengali = false;
    _isArabic = false;

    notifyListeners();
  }

  void toggleEnglish() {
    _isEnglish = !_isEnglish;
    _isSpanish = false;
    _isBengali = false;
    _isArabic = false;
    notifyListeners();
  }

  void toggleBengali() {
    _isBengali = !_isBengali;
    _isSpanish = false;
    _isEnglish = false;
    _isArabic = false;
    notifyListeners();
  }
}
