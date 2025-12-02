import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CouponMore2Provider extends ChangeNotifier {
  final TextEditingController startDateController = TextEditingController(
    text: DateFormat('MMMM dd, yyyy').format(DateTime.now()).toString(),
  );
  final TextEditingController endDateController = TextEditingController(
    text: DateFormat('MMMM dd, yyyy').format(DateTime.now()).toString(),
  );
}
