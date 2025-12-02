import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSmallButton extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final Function() onPressed;
  final double? height;
  final double? width;
  final bool? isOutlined;

  const CustomSmallButton({
    super.key,
    required this.title,
    required this.textColor,
    required this.backgroundColor,
    required this.onPressed,
    this.height = 42,
    this.width,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?.h,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          side:
              isOutlined!
                  ? BorderSide(color: blackColor, width: 1.w)
                  : BorderSide.none,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: GoogleFonts.tajawal(
            textStyle: TextStyle(
              color: textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
