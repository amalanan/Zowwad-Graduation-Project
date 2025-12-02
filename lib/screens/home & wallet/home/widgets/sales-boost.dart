import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SalesBoostRow extends StatelessWidget {
  final String title;
  final String description;
  final Color backgroundColor;
  final VoidCallback onTap;
  final bool? outlined;
  final Widget icon;

  const SalesBoostRow({
    super.key,
    required this.title,
    required this.description,
    required this.backgroundColor,
    required this.onTap,
    this.outlined = false,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16.r),
          border:
              outlined!
                  ? Border.all(color: containerBorderLight, width: 1.w)
                  : null,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.1),
          //     blurRadius: 4,
          //     offset: Offset(0, 2.h),
          //   ),
          // ],
        ),
        child: Row(
          children: [
            icon,
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: blackColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  description,
                  style: TextStyle(color: titleColor, fontSize: 10.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
