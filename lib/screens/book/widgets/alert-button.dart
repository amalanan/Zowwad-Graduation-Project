import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAlertButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;
  final Color fillColor;
  final Color textColor;
  final Color? borderColor;

  const CustomAlertButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    required this.fillColor,
    required this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      width: 132.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined ? Colors.white : fillColor,
          foregroundColor: textColor,
          side:
              isOutlined
                  ? BorderSide(color: borderColor ?? blackColor, width: 1.2)
                  : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isOutlined ? borderColor : textColor,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
