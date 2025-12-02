import 'package:flutter/cupertino.dart';

import '../../../api/app_service.dart';

class VerifyOtpProvider extends ChangeNotifier {
  String email = '';
  String otp = '';
  bool loading = false;
  String? error;
  String? success;

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setOtp(String value) {
    otp = value;
    notifyListeners();
  }

  Future<void> verifyOtp() async {
    if (email.isEmpty || otp.isEmpty) {
      error = "الرجاء إدخال البريد الإلكتروني و رمز التحقق";
      notifyListeners();
      return;
    }

    loading = true;
    error = null;
    success = null;
    notifyListeners();

    try {
      await AppService().verifyOtp(email, otp);
      success = "تم التحقق بنجاح!";
    } catch (e) {
      error = e.toString();
    }

    loading = false;
    notifyListeners();
  }
}
