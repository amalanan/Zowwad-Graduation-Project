import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditItemProvider with ChangeNotifier {
  bool showArabic = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountValueController = TextEditingController();
  final TextEditingController maxQtyController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final Map<String, bool> _checkboxStates = {};

  final Map<String, String?> _selectedValues = {};
  bool isChecked(String key) => _checkboxStates[key] ?? false;

  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;
  final List<File> _images = [];

  List<File> get images => _images;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      _images.add(File(picked.path));
      notifyListeners();
    }
  }

  void removeImage(File image) {
    _images.remove(image);
    notifyListeners();
  }

  void toggleCheck(String key) {
    _checkboxStates[key] = !isChecked(key);
    notifyListeners();
  }

  void setChecked(String key, bool value) {
    _checkboxStates[key] = value;
    notifyListeners();
  }

  Map<String, bool> get allStates => _checkboxStates;
  void setValue(String key, String value) {
    _selectedValues[key] = value;
    notifyListeners();
  }

  String? getValue(String key) {
    return _selectedValues[key];
  }

  void toggleExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  void collapse() {
    _isExpanded = false;
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
