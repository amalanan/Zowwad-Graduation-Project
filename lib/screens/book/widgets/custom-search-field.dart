import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/constants.dart';

class CustomSearchField extends StatelessWidget {
  final Color titleColor;
  final Color fillColor;
  final double borderRadius;
  final TextEditingController controller;
  final double? height;
  final double? width;
  final ValueChanged<String>? onChanged; // 👈 NEW

  const CustomSearchField({
    super.key,
    required this.titleColor,
    required this.fillColor,
    this.borderRadius = 12,
    required this.controller,
    this.height = 48,
    this.width = 288,
    this.onChanged, // 👈 NEW
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        controller: controller,
        onChanged: onChanged, // 👈 NEW
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hintText: "بحث",
          hintTextDirection: TextDirection.rtl,
          hintStyle: TextStyle(color: titleColor),

          filled: true,
          fillColor: fillColor,

          // 🔍 Fixed prefix icons layout
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 8.w),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  cameraIcon,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
              SizedBox(width: 8.w),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  filterIcon,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
              SizedBox(width: 8.w),
            ],
          ),

          suffixIcon: IconButton(
            icon: SvgPicture.asset(searchIcon, height: 24.h, width: 24.w),
            onPressed: () {},
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),

          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 12.h,
          ),
        ),
      ),
    );
  }
}
