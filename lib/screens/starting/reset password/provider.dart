import 'package:flutter/cupertino.dart';

import '../../../api/app_service.dart';

class ResetPasswordProvider extends ChangeNotifier {
  String email = '';
  String token = '';
  String password = '';
  String confirmPassword = '';

  bool loading = false;
  String? error;
  String? success;

  void setEmail(String v) {
    email = v;
    notifyListeners();
  }

  void setToken(String v) {
    token = v;
    notifyListeners();
  }

  void setPassword(String v) {
    password = v;
    notifyListeners();
  }

  void setConfirmPassword(String v) {
    confirmPassword = v;
    notifyListeners();
  }

  Future<void> resetPassword() async {
    if (password != confirmPassword) {
      error = "كلمة المرور غير متطابقة";
      notifyListeners();
      return;
    }

    loading = true;
    error = null;
    success = null;
    notifyListeners();

    try {
      await AppService().resetPassword(email, token, password);
      success = "تم تغيير كلمة المرور بنجاح";
    } catch (e) {
      error = e.toString();
    }

    loading = false;
    notifyListeners();
  }
}
