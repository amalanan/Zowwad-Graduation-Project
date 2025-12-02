import 'package:flutter/material.dart';
import 'package:Zowwad/api/app_service.dart';
import 'package:Zowwad/dto/login_student_request.dart';
import 'package:Zowwad/dto/login_graduate_request.dart';

class SignInProvider extends ChangeNotifier {
  bool _showStudent = false;
  bool get showStudent => _showStudent;

  bool _isVisible1 = false;
  bool get isVisible1 => _isVisible1;

  void toggleVisibility(int fieldIcon) {
    if (fieldIcon == 1) _isVisible1 = !_isVisible1;

    notifyListeners();
  }

  LoginStudentRequestDto studentLogin = LoginStudentRequestDto(
    universityId: '',
    password: '',
  );

    LoginGraduateRequestDto gradLogin = LoginGraduateRequestDto(
    nationalId: '',
    password: '',
  );

  void updateStuPassword(String value) {
    studentLogin.password = value;
    notifyListeners();
  }

  void updateGradPassword(String value) {
    gradLogin.password = value;
    notifyListeners();
  }

  bool loading = false;

  final AppService _service = AppService();

  // Switch tabs
  void showStudentTab() {
    _showStudent = true;
    notifyListeners();
  }

  void showGraduateTab() {
    _showStudent = false;
    notifyListeners();
  }

  // LOGIN FUNCTION (centralized here)
  Future<bool> login(String id, String password) async {
    loading = true;
    notifyListeners();

    try {
      if (_showStudent) {
        // STUDENT LOGIN
        final req = LoginStudentRequestDto(
          universityId: id,
          password: password,
        );
        await _service.loginStudent(req);
      } else {
        // GRADUATE LOGIN
        final req = LoginGraduateRequestDto(nationalId: id, password: password);
        await _service.loginGraduate(req);
      }

      loading = false;
      notifyListeners();
      return true;
    } catch (e) {
      loading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }
}
