import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FadedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const FadedButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          SizedBox(width: 16.w),

          GestureDetector(
            onTap: onPressed,

            child: Container(
              height: 35.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(Icons.double_arrow, color: Colors.white, size: 24.w),
            ),
          ),
          SizedBox(width: 90.w),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
