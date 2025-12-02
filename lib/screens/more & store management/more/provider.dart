import 'dart:io';

import 'package:Zowwad/api/app_service.dart';
import 'package:Zowwad/dto/profile_response_dto.dart';
import 'package:Zowwad/dto/update_profile_request_dto.dart';
import 'package:Zowwad/screens/ad-details/create-ad.dart';
import 'package:Zowwad/screens/business,%20expenses/change-pass/change-pass.dart';
import 'package:Zowwad/screens/business,%20expenses/help,%20support/help,%20support.dart';
import 'package:Zowwad/screens/business,%20expenses/help,%20support/terms-conditions/terms-conditions.dart';
import 'package:Zowwad/screens/business,%20expenses/privacy-policy/privacy-policy.dart';
import 'package:Zowwad/screens/home%20&%20wallet/pending-order-details/pending-order-details.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/categories/categories.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/reviews/reviews.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/constants.dart';

class MoreScreenProvider extends ChangeNotifier {
  // =========================
  // UI Routes
  // =========================

  List<Map<String, dynamic>> bookManagementItems(BuildContext context) => [
    {
      'title': 'إضافة كتاب',
      'icon': addCircle,
      'onTap': () => Navigator.pushNamed(context, CreateAdScreen.id),
      'isLanguageTile': false,
    },
    {
      'title': 'الكتب المعلقة',
      'icon': infoCircle,
      'isLanguageTile': false,
      // 'onTap': () =>
      //     Navigator.pushNamed(context, PendingOrderDetailsScreen.id),
    },
    {
      'title': 'كتبي',
      'icon': categoriesCircle,
      'isLanguageTile': false,
      'onTap': () => Navigator.pushNamed(context, HomeBookScreen.id),
    },
    {
      'title': 'التقييمات',
      'icon': starCircle,
      'isLanguageTile': false,
      'onTap': () => Navigator.pushNamed(context, ReviewsScreen.id),
    },
  ];

  List<Map<String, dynamic>> settingsItems(BuildContext context) => [
    {
      'isLanguageTile': false,
      'title': 'تغيير كلمة المرور',
      'icon': passCircle,
      'onTap': () => Navigator.pushNamed(context, ChangePassScreen.id),
    },
    {
      'isLanguageTile': false,
      'title': 'الدعم الفني',
      'icon': helpCircle,
      'onTap': () => Navigator.pushNamed(context, HelpAndSupportScreen.id),
    },
    {
      'isLanguageTile': false,
      'title': 'سياسة الخصوصية',
      'icon': helpCircle,
      'onTap': () => Navigator.pushNamed(context, PrivacyPolicyScreen.id),
    },
    {
      'isLanguageTile': false,
      'title': 'الشروط والأحكام',
      'icon': termsCircle,
      'onTap': () => Navigator.pushNamed(context, TermsConditionsScreen.id),
    },
  ];
  // Profile state
  ProfileResponseDto? profile;
  bool isLoadingProfile = false;
  bool isSaving = false;

  // Error messages for UI
  String? errorMessage;

  // Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final levelController = TextEditingController();
  final nationalIdController = TextEditingController();
  final universityController = TextEditingController();
  final departmentController = TextEditingController();

  File? imageFile;

  // =========================
  // Error Handling Helpers
  // =========================

  void setError(String message) {
    errorMessage = message;
    notifyListeners();
  }

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }

  Future<void> loadProfile() async {
    isLoadingProfile = true;
    clearError();
    notifyListeners();

    try {
      profile = await AppService().getProfile();
      print("--------------------------------------");
      print(profile!.toJson());
    } catch (e) {
      setError("فشل في تحميل البيانات: ${e.toString()}");
    }

    isLoadingProfile = false;
    notifyListeners();
  }

  void _fillControllersFromProfile() {
    if (profile == null) return;

    nameController.text = profile!.name;
    emailController.text = profile!.email;
    phoneController.text = profile!.phoneNumber;
    levelController.text = profile!.role;
    nationalIdController.text = profile!.nationalId!;
    universityController.text = profile!.university;
    departmentController.text = profile!.department;
  }

  // =========================
  // Pick Image
  // =========================

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      imageFile = File(picked.path);
      notifyListeners();
    }
  }

  // =========================
  // Save Profile
  // =========================

  Future<void> saveProfile() async {
    isSaving = true;
    errorMessage = null;
    notifyListeners();

    try {
      await AppService().updateProfile(
        UpdateProfileRequestDto(
          name: nameController.text.isNotEmpty
              ? nameController.text
              : profile!.name,
          email: emailController.text.isNotEmpty
              ? emailController.text
              : profile!.email,
          phoneNumber: phoneController.text.isNotEmpty
              ? phoneController.text
              : profile!.phoneNumber,
          universityId: profile!.universityId, // Always comes from the backend
          university: universityController.text.isNotEmpty
              ? universityController.text
              : profile!.university,
          department: departmentController.text.isNotEmpty
              ? departmentController.text
              : profile!.department,
          role: levelController.text.isNotEmpty
              ? levelController.text
              : profile!.role,
          nationalId: nationalIdController.text.isNotEmpty
              ? nationalIdController.text
              : profile!.nationalId,
          // Image: Only send if there's a new one picked, else send null
          image: imageFile,
        ),
      );

      // Reload profile after update
      await loadProfile();

    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    levelController.dispose();
    nationalIdController.dispose();
    universityController.dispose();
    departmentController.dispose();
    super.dispose();
  }
}
