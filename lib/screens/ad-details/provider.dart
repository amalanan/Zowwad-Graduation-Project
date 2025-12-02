import 'package:Zowwad/dto/FacultyBook/create_book_dto.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:Zowwad/api/app_service.dart';

class CreateAdProvider with ChangeNotifier {
  // ===== UI State (Existing) =====
  bool delivery = true;
  bool cutlery = true;
  bool takeAway = true;

  // ===== Image State =====
  File? _logoImage;  // main book image
  File? _coverImage; // cover image

  File? get logoImage => _logoImage;
  File? get coverImage => _coverImage;

  // ===== Controllers for Book Fields =====
  final TextEditingController bookTitleController = TextEditingController();
  final TextEditingController facultyNameController = TextEditingController();

  // ===== API State =====
  bool isLoading = false;
  bool creationSuccess = false;
  String? errorMessage;

  // ===== Image Picker Logic =====
  Future<void> pickLogoImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      _logoImage = File(picked.path);
      notifyListeners();
    }
  }

  void removeLogoImage() {
    _logoImage = null;
    notifyListeners();
  }

  Future<void> pickCoverImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      _coverImage = File(picked.path);
      notifyListeners();
    }
  }

  void removeCoverImage() {
    _coverImage = null;
    notifyListeners();
  }

  // ===== Toggle Logic =====
  void toggleDelivery(bool value) {
    delivery = value;
    notifyListeners();
  }

  void toggleCutlery(bool value) {
    cutlery = value;
    notifyListeners();
  }

  void toggleTakeAway(bool value) {
    takeAway = value;
    notifyListeners();
  }

  // ===== Book Submit Logic =====
  Future<void> submitBook() async {
    // Validate inputs
    if (bookTitleController.text.isEmpty ||
        facultyNameController.text.isEmpty) {
      errorMessage = 'الصورة، اسم الكتاب، واسم الكلية مطلوبة';
      notifyListeners();
      return;
    }

    isLoading = true;
    creationSuccess = false;
    errorMessage = null;
    notifyListeners();

    try {
      final dto = CreateBookRequestDto(
        title: bookTitleController.text.trim(),
        image: _logoImage,
        coverImage: _coverImage,
        condition: "جديد",
        status: "متوفر",
        name: facultyNameController.text.trim(),

      );

      await AppService().createBook(dto);
      creationSuccess = true;
    } catch (e) {
      creationSuccess = false;
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ===== Optional: Reset form =====
  void resetForm() {
    _logoImage = null;
    _coverImage = null;
    bookTitleController.clear();
    facultyNameController.clear();
    creationSuccess = false;
    notifyListeners();
  }

  // ===== Dispose Controllers =====
  @override
  void dispose() {
    bookTitleController.dispose();
    facultyNameController.dispose();
    super.dispose();
  }
}
