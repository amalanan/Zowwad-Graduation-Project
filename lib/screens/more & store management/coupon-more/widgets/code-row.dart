import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/constants.dart';

class CodeRow extends StatelessWidget {
  final Widget icon;
  final String label;
  final String code;

  const CodeRow({
    super.key,
    required this.icon,
    required this.label,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
              ],
            ),
          ],
        ),
        Container(
          height: 25.h,
          width: 75.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(500.r),
            color: greenColor,
          ),
          child: Center(
            child: Text(
              code.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
