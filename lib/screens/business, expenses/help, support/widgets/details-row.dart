import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/constants.dart';

class DetailsRow extends StatelessWidget {
  const DetailsRow({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  final Widget icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: blackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: TextStyle(color: titleColor, fontSize: 12.sp),
                ),
              ],
            ),
          ),
          SizedBox(width: 18.w),
          icon,
        ],
      ),
    );
  }
}
