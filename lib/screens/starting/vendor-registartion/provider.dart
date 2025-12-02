import 'package:Zowwad/api/app_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:Zowwad/dto/register_request.dart';

class RegistrationProvider with ChangeNotifier {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController universityController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController studyLevelController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();


  bool _showEnglish = true;

  // 🔵 STUDENT / GRADUATE
  bool _isStudent = false; // your original variable
  bool get isStudent => _isStudent;

  // 🔵 DTO HOLDER
  RegisterRequestDto registerDto = RegisterRequestDto.empty();

  Position? _currentPosition;
  bool _isLoading = false;
  String? _error;

  bool _isVisible1 = false;
  bool get isVisible1 => _isVisible1;

  bool _isVisible2 = false;
  bool get isVisible2 => _isVisible2;

  // ----------------------------
  // 🔵 PASSWORD VISIBILITY
  // ----------------------------
  void toggleVisibility(int fieldIcon) {
    if (fieldIcon == 1) _isVisible1 = !_isVisible1;
    if (fieldIcon == 2) _isVisible2 = !_isVisible2;

    notifyListeners();
  }

  Position? get currentPosition => _currentPosition;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get showEnglish => _showEnglish;

  // ----------------------------
  // 🔵 STEPPER
  // ----------------------------
  final List<String> stepTitles = [
    'Vendor Information',
    'Location Information',
    'Review',
  ];

  int _currentStep = 0;
  int get currentStep => _currentStep;

  void nextStep() {
    if (_currentStep < 2) {
      _currentStep++;
      notifyListeners();
    }
  }

  void previousStep() {
    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
    }
  }

  void showEnglishTab() {
    _showEnglish = true;
    notifyListeners();
  }

  void showArabicTab() {
    _showEnglish = false;
    notifyListeners();
  }

  // ------------------------------------------------------------
  // 🔵 STUDENT / GRADUATE TOGGLE — Updated to fill DTO correctly
  // ------------------------------------------------------------
  void toggleCommissionType(bool isStudent) {
    _isStudent = isStudent;

    // Update role in DTO
    registerDto.role = isStudent ? "طالب" : "خريج";

    notifyListeners();
  }

  // ------------------------------------------------------------
  // 🔵 LOCATION (unchanged)
  // ------------------------------------------------------------
  Future<void> getCurrentLocation() async {
    _isLoading = true;
    notifyListeners();

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _error = "Location services are disabled";
        notifyListeners();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _error = "Location permissions denied";
          notifyListeners();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        _error = "Location permissions permanently denied";
        notifyListeners();
        return;
      }

      _currentPosition = await Geolocator.getCurrentPosition();
      _error = null;
    } catch (e) {
      _error = "Failed to fetch location: ${e.toString()}";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ------------------------------------------------------------
  // 🔵 ADD: UPDATE METHODS TO STORE DATA INTO DTO
  // ------------------------------------------------------------

  void updateFullName(String value) {
    registerDto.name = value;
    notifyListeners();
  }

  void updateEmail(String value) {
    registerDto.email = value;
    notifyListeners();
  }

  void updatePhone(String value) {
    registerDto.phoneNumber = value;
    notifyListeners();
  }

  void updateStudyLevel(String value) {
    registerDto.role = value ;
    notifyListeners();

    // optional if you want to save it
  }

  void updateUniversityName(String value) {
    registerDto.university = value;
    notifyListeners();
  }

  void updateDepartment(String value) {
    registerDto.department = value;
    notifyListeners();
  }

  void updateId(String value) {
    // If student: save university_id
    if (_isStudent) {
      registerDto.universityId = value;
      registerDto.nationalId = "";
    }
    // If graduate: save national_id
    else {
      registerDto.nationalId = value;
      registerDto.universityId = "";
    }
    notifyListeners();
  }
  Future<void> submitRegistration() async {
    try {

      await AppService().register(registerDto);
    } catch (e) {
      // Re-throw so UI handles the error
      rethrow; // keeps original API message
    }
  }



  void updatePassword(String value) {
    registerDto.password = value;
    notifyListeners();
  }

  void updateConfirmPassword(String value) {
    registerDto.passwordConfirmation = value;
    notifyListeners();
  }

  void updateAddress(String value) {
    registerDto.address = value;
    notifyListeners();
  }
}
