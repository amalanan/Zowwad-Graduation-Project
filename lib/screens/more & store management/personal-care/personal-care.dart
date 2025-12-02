import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/personal-care/data.dart';
import 'package:Zowwad/screens/book/widgets/items-grid-view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryProductsScreen extends StatelessWidget {
  static const id = '/care';

  const CategoryProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Personal Care'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16.0.h),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(child: ItemsGridView(items: items)),
            ),
          ),
        ),
      ),
    );
  }
}
