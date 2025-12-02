import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/constants.dart';

class BoxContainer extends StatelessWidget {
  final Widget child;
  const BoxContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: containerBorderLight, width: 1.w),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: child,
    );
  }
}
