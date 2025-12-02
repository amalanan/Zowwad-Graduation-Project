import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoneyColumn extends StatelessWidget {
  final String title;
  final String amount;

  const MoneyColumn({super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyle(color: titleColor, fontSize: 14.sp)),
        SizedBox(height: 16.h),
        Text(
          amount,
          style: TextStyle(
            color: blackColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
