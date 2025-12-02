import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRadio extends StatelessWidget {
  final String title;
  final List<String> options;

  const CustomRadio({super.key, required this.title, required this.options});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: blackColor,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:
              options.map((option) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.radio_button_unchecked,
                      color: Color(0xFF6D6D6D),
                      size: 24.sp,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      option,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF6D6D6D),
                      ),
                    ),
                    SizedBox(width: 12.w),
                  ],
                );
              }).toList(),
        ),
      ],
    );
  }
}
