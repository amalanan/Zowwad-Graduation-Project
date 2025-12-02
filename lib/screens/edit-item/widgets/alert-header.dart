import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AlertHeader extends StatelessWidget {
  final String title;

  const AlertHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }
}
