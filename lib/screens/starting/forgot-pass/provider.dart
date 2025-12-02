import 'package:flutter/cupertino.dart';

import '../../../api/app_service.dart';

class EmailProvider extends ChangeNotifier {
  String email = '';
  bool isLoading = false;
  String? error;
  String? success;

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  Future<void> sendForgotPassword() async {
    if (email.isEmpty) {
      error = "Please enter your email.";
      notifyListeners();
      return;
    }

    isLoading = true;
    error = null;
    success = null;
    notifyListeners();

    try {
      await AppService().forgotPassword(email);
      success = "Password reset link sent successfully!";
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
