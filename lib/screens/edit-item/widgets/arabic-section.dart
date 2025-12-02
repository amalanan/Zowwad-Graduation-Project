import 'package:flutter/material.dart';

class ArabicSection extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountValueController = TextEditingController();
  final TextEditingController maxQtyController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  String discountType = 'Amount';

  ArabicSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
