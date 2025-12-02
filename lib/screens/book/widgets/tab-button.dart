import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;
  final Color selectedColor;
  final Color unselectedColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final Color selectedBorderColor;
  final Color unselectedBorderColor;
  final bool? useFixedWidth;
  final double? width;
  final double? height;

  const TabButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
    required this.selectedColor,
    required this.unselectedColor,
    required this.selectedTextColor,
    required this.unselectedTextColor,
    required this.selectedBorderColor,
    required this.unselectedBorderColor,
    this.useFixedWidth = true,
    this.width,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: isSelected ? selectedColor : unselectedColor,
        foregroundColor: isSelected ? selectedTextColor : unselectedTextColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: isSelected ? selectedBorderColor : unselectedBorderColor,
            width: 1,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        minimumSize:
            useFixedWidth! ? Size(width ?? 168.w, height ?? 40.h) : null,
      ),
      child: Text(
        label,
        style: GoogleFonts.tajawal(
          textStyle: TextStyle(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );

    return useFixedWidth!
        ? SizedBox(width: width ?? 168.w, height: height ?? 40.h, child: button)
        : button;
  }
}
