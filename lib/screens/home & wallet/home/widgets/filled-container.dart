import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilledContainer extends StatelessWidget {
  final Widget child;
  final bool? symmetricPadding;

  const FilledContainer({
    super.key,
    required this.child,
    this.symmetricPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          !symmetricPadding!
              ? EdgeInsets.only(left: 16.w, top: 16.h)
              : EdgeInsets.all(16.w),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: containerColor,
        border: Border.all(color: containerBorderLight, width: 1.w),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: child,
    );
  }
}
