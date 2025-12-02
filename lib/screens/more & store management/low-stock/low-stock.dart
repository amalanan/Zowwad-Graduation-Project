import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ad-details/widgets/custom-app-bar.dart';
import '../../book/widgets/items-grid-view.dart';
import '../personal-care/data.dart';

class LowStockScreen extends StatelessWidget {
  static const id = '/stock';

  const LowStockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Low Stock'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16.0.h),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: ItemsGridView(stock: true, items: items),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
