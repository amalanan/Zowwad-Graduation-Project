import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStepper extends StatelessWidget {
  final bool isActive;
  final bool isCompleted;

  const CustomStepper({
    super.key,
    required this.isActive,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    Color? lineColor = isCompleted || isActive ? greenColor : Colors.grey[300];

    return Expanded(
      child: Container(
        height: 6.h,
        decoration: BoxDecoration(
          color: lineColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
    );
  }
}
