import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double? width;
  final double? height;
  final bool? outlined;
  final Widget? icon;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.width = double.infinity,
    this.height = 50,
    this.outlined = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w,
      height: height?.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          side: outlined! ? BorderSide(color: titleColor) : null,
          shadowColor: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            if (icon != null) SizedBox(width: 3.w),
            Text(
              text,
              style: GoogleFonts.tajawal(
                textStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: outlined! ? blackColor : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
