import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertHandle extends StatelessWidget {
  const AlertHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Container(
          width: 40.w,
          height: 4.h,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }}
