import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTag extends StatelessWidget {
  final String text;

  const CustomTag({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.w,
      height: 22.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(500.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: titleColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SvgPicture.asset(closeGreyIcon, height: 12.h, width: 12.w),
        ],
      ),
    );
  }
}
