import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomParentContainer extends StatelessWidget {
  final List<Widget> children;

  const CustomParentContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0.h),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
