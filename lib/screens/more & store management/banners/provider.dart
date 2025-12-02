import 'package:flutter/material.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

class BannersProvider extends ChangeNotifier {
  bool showArabic = false;

  File? _selectedBanner;

  File? get selectedBanner => _selectedBanner;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      _selectedBanner = File(picked.path);
      notifyListeners();
    }
  }

  void removeBanner() {
    _selectedBanner = null;
    notifyListeners();
  }

  void showArabicTab() {
    showArabic = true;
    notifyListeners();
  }

  void showEnglishTab() {
    showArabic = false;
    notifyListeners();
  }
}
