import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/constants.dart';

class SmallContainer extends StatelessWidget {
  final Color color;
  final String title;
  const SmallContainer({super.key, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.h,
      width: 72.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(500.r),
        border: Border.all(color: containerBorderLight, width: 1.w),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: primaryColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
