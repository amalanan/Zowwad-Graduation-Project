import 'package:flutter/material.dart';

class WalletProvider extends ChangeNotifier {
  bool showWithdraw = true;
  bool _isPaypal = false;

  bool get isPaypal => _isPaypal;

  void showWithdrawTab() {
    showWithdraw = true;
    notifyListeners();
  }

  void showPaymentTab() {
    showWithdraw = false;
    notifyListeners();
  }

  void togglePayingType(bool isPaypal) {
    _isPaypal = isPaypal;
    notifyListeners();
  }
}
