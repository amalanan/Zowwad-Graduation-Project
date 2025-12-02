import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoneyRow extends StatelessWidget {
  final String title;
  final String amount;

  const MoneyRow({super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          amount,
          style: TextStyle(
            color: blackColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 16.h),
        Text(title, style: TextStyle(color: titleColor, fontSize: 14.sp)),
      ],
    );
  }
}
