import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavProvider extends ChangeNotifier {
  int _currentIndex = 3;
  int get currentIndex => _currentIndex;
  int? _selectedBookId;
int get selectedBookId => _selectedBookId ?? 0;


  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }


}
