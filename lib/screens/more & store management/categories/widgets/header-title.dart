import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderTitle extends StatelessWidget {
  final String title;
  const HeaderTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textAlign: TextAlign.center,
        title,
        style: TextStyle(
          color: blackColor,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}
