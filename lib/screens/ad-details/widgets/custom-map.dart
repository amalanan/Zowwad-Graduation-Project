import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMap extends StatelessWidget {
  final String assetPath;
  final double height;
  final double borderRadius;

  const CustomMap({
    super.key,
    required this.assetPath,
    this.height = 138,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: blackColor, width: 0.5.w),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.asset(assetPath, height: height, fit: BoxFit.cover),
      ),
    );
  }
}
